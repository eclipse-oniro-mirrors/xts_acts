/*
 * Copyright (c) 2020-2021 Huawei Device Co., Ltd.
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

#include <securec.h>
#include "hctest.h"
#include "ohos_types.h"
#include "parameter.h"
#include "parameter_utils.h"

#define MAX_LEN 128
#define INVALID_LEN 2
#define COMMON_ERROR (-1)
#define INVALID_PARAMETER (-9)

static const char *g_defSysParam = "data of sys param ***...";

LITE_TEST_SUIT(startup, deviceinfo, DeviceInfoFuncTestSuite);

/**
 * @tc.setup     : setup for all testcases
 * @return       : setup result, TRUE is success, FALSE is fail
 */
static BOOL DeviceInfoFuncTestSuiteSetUp(void)
{
  return TRUE;
}

/**
 * @tc.teardown  : teardown for all testcases
 * @return       : teardown result, TRUE is success, FALSE is fail
 */
static BOOL DeviceInfoFuncTestSuiteTearDown(void)
{
  printf("+--------------------------------------------+\n");
  return TRUE;
}

/**
 * @tc.name   testGetDeviceTypeFun001
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_0100
 * @tc.desc   test obtaining device info DeviceType is not null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetDeviceTypeFun001,
               Function | MediumTest | Level1)
{
  const char *value = GetDeviceType();
  printf("Device Type=%s\n", value);
  AssertNotEmpty(value);
};

/**
 * @tc.name   testGetDeviceTypeFun002
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_0200
 * @tc.desc   test obtaining device info DeviceType that less than 32
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetDeviceTypeFun002,
               Function | MediumTest | Level1)
{
  const char *value = GetDeviceType();
  printf("Device Type=%s\n", value);
  TEST_ASSERT_NOT_NULL(value);
  if (value != NULL)
  {
    TEST_ASSERT_TRUE(strlen(value) <= 32);
  }
};

/**
 * @tc.name   testGetManufactureFun001
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_0300
 * @tc.desc   test obtaining device info Manufacture is not null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetManufactureFun001,
               Function | MediumTest | Level1)
{
  const char *value = GetManufacture();
  printf("Manufacture=%s\n", value);
  AssertNotEmpty(value);
};

/**
 * @tc.name   testGetManufactureFun002
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_0400
 * @tc.desc   test obtaining device info Manufacture that less than 32
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetManufactureFun002,
               Function | MediumTest | Level1)
{
  const char *value = GetManufacture();
  printf("Manufacture=%s\n", value);
  TEST_ASSERT_NOT_NULL(value);
  if (value != NULL)
  {
    TEST_ASSERT_TRUE(strlen(value) <= 32);
  }
};

/**
 * @tc.name   testGetBrandFun001
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_0500
 * @tc.desc   test obtaining device info Brand is not null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetBrandFun001,
               Function | MediumTest | Level1)
{
  const char *value = GetBrand();
  printf("Brand=%s\n", value);
  AssertNotEmpty(value);
};

/**
 * @tc.name   testGetBrandFun002
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_0600
 * @tc.desc   test obtaining device info Brand that less than 32
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetBrandFun002,
               Function | MediumTest | Level1)
{
  const char *value = GetBrand();
  printf("Brand=%s\n", value);
  TEST_ASSERT_NOT_NULL(value);
  if (value != NULL)
  {
    TEST_ASSERT_TRUE(strlen(value) <= 32);
  }
};

/**
 * @tc.name   testGetMarketNameFun001
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_0700
 * @tc.desc   test obtaining device info MarketName is not null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetMarketNameFun001,
               Function | MediumTest | Level1)
{
  const char *value = GetMarketName();
  printf("Market Name=%s\n", value);
  AssertNotEmpty(value);
};

/**
 * @tc.name   testGetMarketNameFun002
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_0800
 * @tc.desc   test obtaining device info MarketName that less than 32
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetMarketNameFun002,
               Function | MediumTest | Level1)
{
  const char *value = GetMarketName();
  printf("Market Name=%s\n", value);
  TEST_ASSERT_NOT_NULL(value);
  if (value != NULL)
  {
    TEST_ASSERT_TRUE(strlen(value) <= 32);
  }
};

/**
 * @tc.name   testGetProductSeriesFun001
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_0900
 * @tc.desc   test obtaining device info ProductSeries is not null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetProductSeriesFun001,
               Function | MediumTest | Level1)
{
  const char *value = GetProductSeries();
  printf("Product Series=%s\n", value);
  AssertNotEmpty(value);
};

/**
 * @tc.name   testGetProductSeriesFun002
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_1000
 * @tc.desc   test obtaining device info ProductSeries that less than 32
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetProductSeriesFun002,
               Function | MediumTest | Level1)
{
  const char *value = GetProductSeries();
  printf("Product Series=%s\n", value);
  TEST_ASSERT_NOT_NULL(value);
  if (value != NULL)
  {
    TEST_ASSERT_TRUE(strlen(value) <= 32);
  }
};

/**
 * @tc.name   testGetProductModelFun001
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_1100
 * @tc.desc   test obtaining device info ProductModel is not null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetProductModelFun001,
               Function | MediumTest | Level1)
{
  const char *value = GetProductModel();
  printf("Product Model=%s\n", value);
  AssertNotEmpty(value);
};

/**
 * @tc.name   testGetProductModelFun002
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_1200
 * @tc.desc   test obtaining device info ProductModel that less than 32
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetProductModelFun002,
               Function | MediumTest | Level1)
{
  const char *value = GetProductModel();
  printf("Product Model=%s\n", value);
  TEST_ASSERT_NOT_NULL(value);
  if (value != NULL)
  {
    TEST_ASSERT_TRUE(strlen(value) <= 32);
  }
};

/**
 * @tc.name   testGetHardwareModel001
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_1300
 * @tc.desc   test obtaining device info HardwareModel is not null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetHardwareModel001,
               Function | MediumTest | Level1)
{
  const char *value = GetHardwareModel();
  printf("Hardware Model=%s\n", value);
  AssertNotEmpty(value);
};

/**
 * @tc.name   testGetHardwareModel002
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_1400
 * @tc.desc   test obtaining device info HardwareModel that less than 32
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetHardwareModel002,
               Function | MediumTest | Level1)
{
  const char *value = GetHardwareModel();
  printf("Hardware Model=%s\n", value);
  TEST_ASSERT_NOT_NULL(value);
  if (value != NULL)
  {
    TEST_ASSERT_TRUE(strlen(value) <= 32);
  }
};

/**
 * @tc.name   testGetSerialFun001
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_1500
 * @tc.desc   test obtaining device info Serial is not null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetSerialFun001,
               Function | MediumTest | Level1)
{
  const char *value = GetSerial();
  printf("Serial=%s\n", value);
  AssertNotEmpty(value);
};

/**
 * @tc.name   testGetSerialFun002
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_1600
 * @tc.desc   test obtaining device info Serial that less than 64
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetSerialFun002,
               Function | MediumTest | Level1)
{
  const char *value = GetSerial();
  printf("Serial=%s\n", value);
  TEST_ASSERT_NOT_NULL(value);
  if (value != NULL)
  {
    TEST_ASSERT_TRUE(strlen(value) <= 64);
  }
};

/**
 * @tc.name   testGetOSFullNameFun001
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_1700
 * @tc.desc   test obtaining device info OSFullName is not null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetOSFullNameFun001,
               Function | MediumTest | Level1)
{
  const char *value = GetOSFullName();
  printf("Os Name=%s\n", value);
  AssertNotEmpty(value);
};

/**
 * @tc.name   testGetOSFullNameFun002
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_1800
 * @tc.desc   test obtaining device info OSFullName that less than 64
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetOSFullNameFun002,
               Function | MediumTest | Level1)
{
  const char *value = GetOSFullName();
  printf("Os Name=%s\n", value);
  TEST_ASSERT_NOT_NULL(value);
  if (value != NULL)
  {
    TEST_ASSERT_TRUE(strlen(value) <= 64);
  }
};

/**
 * @tc.name   testGetDisplayVersionFun001
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_1900
 * @tc.desc   test obtaining device info DisplayVersion is not null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetDisplayVersionFun001,
               Function | MediumTest | Level1)
{
  const char *value = GetDisplayVersion();
  printf("Display Version=%s\n", value);
  AssertNotEmpty(value);
};

/**
 * @tc.name   testGetDisplayVersionFun002
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_2000
 * @tc.desc   test obtaining device info DisplayVersion that less than 64
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetDisplayVersionFun002,
               Function | MediumTest | Level1)
{
  const char *value = GetDisplayVersion();
  printf("Display Version=%s\n", value);
  TEST_ASSERT_NOT_NULL(value);
  if (value != NULL)
  {
    TEST_ASSERT_TRUE(strlen(value) <= 64);
  }
};

/**
 * @tc.name   testGetBootloaderVersionFun001
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_2100
 * @tc.desc   test obtaining device info BootloaderVersion is not null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetBootloaderVersionFun001,
               Function | MediumTest | Level1)
{
  const char *value = GetBootloaderVersion();
  printf("Bootloader Version=%s\n", value);
  AssertNotEmpty(value);
};

/**
 * @tc.name   testGetBootloaderVersionFun002
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_2200
 * @tc.desc   test obtaining device info BootloaderVersion that less
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetBootloaderVersionFun002,
               Function | MediumTest | Level1)
{
  const char *value = GetBootloaderVersion();
  printf("Bootloader Version=%s\n", value);
  TEST_ASSERT_NOT_NULL(value);
  if (value != NULL)
  {
    TEST_ASSERT_TRUE(strlen(value) <= 64);
  }
};

/**
 * @tc.name   testGetSecurityPatchTagFun001
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_2300
 * @tc.desc   test obtaining device info SecurityPatchTag is not null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetSecurityPatchTagFun001,
               Function | MediumTest | Level1)
{
  const char *value = GetSecurityPatchTag();
  printf("Secure Patch Level=%s\n", value);
  AssertNotEmpty(value);
};

/**
 * @tc.name   testGetSecurityPatchTagFun002
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_2400
 * @tc.desc   test obtaining device info SecurityPatchTag that less
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetSecurityPatchTagFun002,
               Function | MediumTest | Level1)
{
  const char *value = GetSecurityPatchTag();
  printf("Secure Patch Level=%s\n", value);
  TEST_ASSERT_NOT_NULL(value);
  if (value != NULL)
  {
    TEST_ASSERT_TRUE(strlen(value) <= 64);
  }
};

/**
 * @tc.name   testGetSecurityPatchTagFun003
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_2500
 * @tc.desc   test obtaining device info SecurityPatchTag which format is
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetSecurityPatchTagFun003,
               Function | MediumTest | Level1)
{
  const char *value = GetSecurityPatchTag();
  printf("Secure Patch Level=%s\n", value);

  int year, month, day;
  const int RET_SUCCESS = 0;
  int ret = sscanf_s(value, "%04d\/%02d\/%02d", &year, &month, &day);
  if (ret < RET_SUCCESS)
  {
    TEST_ASSERT_TRUE(ret >= 0);
  }
  printf("%04d\/%02d\/%02d\n", year, month, day);

  TEST_ASSERT_TRUE(year > 1900 && year < 2056);
  TEST_ASSERT_TRUE(month <= 12 && month > 0);
  TEST_ASSERT_TRUE(day <= 31 && day > 0);

  char str[10] = {0};
  ret = sprintf_s(str, sizeof(str) + 1, "%d\/%02d\/%02d", year, month, day);
  if (ret < RET_SUCCESS)
  {
    TEST_ASSERT_TRUE(ret >= 0);
  }
  printf("str=%s\n", str);
  TEST_ASSERT_EQUAL_STRING(str, value);
};

/**
 * @tc.name   testGetAbiListFun001
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_2600
 * @tc.desc   test obtaining device info AbiList is not null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetAbiListFun001,
               Function | MediumTest | Level1)
{
  const char *value = GetAbiList();
  printf("Abi List=%s\n", value);
  AssertNotEmpty(value);
};

/**
 * @tc.name   testGetAbiListFun002
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_2700
 * @tc.desc   test obtaining device info AbiList that less than 64
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetAbiListFun002,
               Function | MediumTest | Level1)
{
  const char *value = GetAbiList();
  printf("Abi List=%s\n", value);
  TEST_ASSERT_NOT_NULL(value);
  if (value != NULL)
  {
    TEST_ASSERT_TRUE(strlen(value) <= 64);
  }
};

/**
 * @tc.name   testGetSdkApiVersionFun001
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_2800
 * @tc.desc   test obtaining device info SdkApiVersion is not null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetSdkApiVersionFun001,
               Function | MediumTest | Level1)
{
  int value = GetSdkApiVersion();
  printf("Sdk Api Level=%d\n", value);
  TEST_ASSERT_TRUE(value > 0);
};

/**
 * @tc.name   testGetFirstApiVersionFun001
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_2900
 * @tc.desc   test obtaining device info FirstApiVersion is not null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetFirstApiVersionFun001,
               Function | MediumTest | Level1)
{
  int value = GetFirstApiVersion();
  printf("First Api Level=%d\n", value);
  TEST_ASSERT_TRUE(value > 0);
};

/**
 * @tc.name   testGetIncrementalVersionFun001
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_3000
 * @tc.desc   test obtaining device info IncrementalVersion is not null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetIncrementalVersionFun001,
               Function | MediumTest | Level1)
{
  const char *value = GetIncrementalVersion();
  printf("Incremental Version=%s\n", value);
  AssertNotEmpty(value);
};

/**
 * @tc.name   testGetVersionIdFun001
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_3100
 * @tc.desc   test obtaining device info VersionId is not null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetVersionIdFun001,
               Function | MediumTest | Level1)
{
  const char *value = GetVersionId();
  printf("Version Id=%s\n", value);
  AssertNotEmpty(value);
};

/**
 * @tc.name   testGetVersionIdFun002
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_3200
 * @tc.desc   test obtaining device info VersionId that less than 127
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetVersionIdFun002,
               Function | MediumTest | Level1)
{
  const char *value = GetVersionId();
  printf("Version Id=%s\n", value);
  TEST_ASSERT_NOT_NULL(value);
  if (value != NULL)
  {
    TEST_ASSERT_TRUE(strlen(value) <= 127);
  }
};

/**
 * @tc.name   testGetBuildTypeFun001
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_3300
 * @tc.desc   test obtaining device info BuildType is not null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetBuildTypeFun001,
               Function | MediumTest | Level1)
{
  const char *value = GetBuildType();
  printf("Build Type=%s\n", value);
  AssertNotEmpty(value);
};

/**
 * @tc.name   testGetBuildTypeFun002
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_3400
 * @tc.desc   test obtaining device info BuildType that less than 32
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetBuildTypeFun002,
               Function | MediumTest | Level1)
{
  const char *value = GetBuildType();
  printf("Build Type=%s\n", value);
  TEST_ASSERT_NOT_NULL(value);
  if (value != NULL)
  {
    TEST_ASSERT_TRUE(strlen(value) <= 32);
  }
};

/**
 * @tc.name   testGetBuildUserFun001
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_3500
 * @tc.desc   test obtaining device info BuildUser is not null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetBuildUserFun001,
               Function | MediumTest | Level1)
{
  const char *value = GetBuildUser();
  printf("Build User=%s\n", value);
  AssertNotEmpty(value);
};

/**
 * @tc.name   testGetBuildUserFun002
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_3600
 * @tc.desc   test obtaining device info BuildUser that less than 32
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetBuildUserFun002,
               Function | MediumTest | Level1)
{
  const char *value = GetBuildUser();
  printf("Build User=%s\n", value);
  TEST_ASSERT_NOT_NULL(value);
  if (value != NULL)
  {
    TEST_ASSERT_TRUE(strlen(value) <= 32);
  }
};

/**
 * @tc.name   testGetBuildHostFun001
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_3700
 * @tc.desc   test obtaining device info BuildHost is not null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetBuildHostFun001,
               Function | MediumTest | Level1)
{
  const char *value = GetBuildHost();
  printf("Build Host=%s\n", value);
  AssertNotEmpty(value);
};

/**
 * @tc.name   testGetBuildHostFun002
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_3800
 * @tc.desc   test obtaining device info BuildHost that less than 32
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetBuildHostFun002,
               Function | MediumTest | Level1)
{
  const char *value = GetBuildHost();
  printf("Build Host=%s\n", value);
  TEST_ASSERT_NOT_NULL(value);
  if (value != NULL)
  {
    TEST_ASSERT_TRUE(strlen(value) <= 32);
  }
};

/**
 * @tc.name   testGetBuildTimeFun001
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_3900
 * @tc.desc   test obtaining device info BuildTime is not null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetBuildTimeFun001,
               Function | MediumTest | Level1)
{
  const char *value = GetBuildTime();
  printf("Build Time=%s\n", value);
  AssertNotEmpty(value);
};

/**
 * @tc.name   testGetBuildTimeFun002
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_4000
 * @tc.desc   test obtaining device info BuildTime that less than 32
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetBuildTimeFun002,
               Function | MediumTest | Level1)
{
  const char *value = GetBuildTime();
  printf("Build Time=%s\n", value);
  TEST_ASSERT_NOT_NULL(value);
  if (value != NULL)
  {
    TEST_ASSERT_TRUE(strlen(value) <= 32);
  }
};

/**
 * @tc.name   testGetSoftwareModelFun001
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_4100
 * @tc.desc   test obtaining device info SoftwareModel is not null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetSoftwareModelFun001,
               Function | MediumTest | Level1)
{
  const char *value = GetSoftwareModel();
  printf("Software Model=%s\n", value);
  AssertNotEmpty(value);
};

/**
 * @tc.name   testGetSoftwareModelFun002
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_4200
 * @tc.desc   test obtaining device info SoftwareModel that less than 32
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetSoftwareModelFun002,
               Function | MediumTest | Level1)
{
  const char *value = GetSoftwareModel();
  printf("Software Model=%s\n", value);
  TEST_ASSERT_NOT_NULL(value);
  if (value != NULL)
  {
    TEST_ASSERT_TRUE(strlen(value) <= 32);
  }
};

/**
 * @tc.name   testGetBuildRootHashFun001
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_4500
 * @tc.desc   test obtaining device info BuildRootHash is not null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetBuildRootHashFun001,
               Function | MediumTest | Level1)
{
  const char *value = GetBuildRootHash();
  printf("Build Root Hash=%s\n", value);
  TEST_ASSERT_NOT_NULL(value);
};

/**
 * @tc.name   testGetHardwareProfileFun001
 * @tc.number SUB_STARTUP_MINI_DEVICEINFO_FUN_4600
 * @tc.desc   test obtaining device info HardwareProfile is not null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
LITE_TEST_CASE(DeviceInfoFuncTestSuite,
               testGetHardwareProfileFun001,
               Function | MediumTest | Level1)
{
  const char *value = GetHardwareProfile();
  printf("Hardware Profile=%s\n", value);
  AssertNotEmpty(value);
};

RUN_TEST_SUITE(DeviceInfoFuncTestSuite);
