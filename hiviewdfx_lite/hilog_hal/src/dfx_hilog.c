/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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


#include <hiview_util.h>
#include <securec.h>
#include <hiview_config.h>
#include <hiview_def.h>
#include "hiview_output_log.h"
#include "log.h"
#include "hctest.h"

LITE_TEST_SUIT(dfx, dfxlite, DfxFuncTestSuite);

/**
 * @tc.setup     : setup for all testcases
 * @return       : setup result, TRUE is success, FALSE is fail
 */
static BOOL DfxFuncTestSuiteSetUp(void)
{
    return TRUE;
}

/**
 * @tc.teardown  : teardown for all testcases
 * @return       : teardown result, TRUE is success, FALSE is fail
 */
static BOOL DfxFuncTestSuiteTearDown(void)
{
    printf("+-------------------------------------------+\n");
    return TRUE;
}

/**
 * @tc.name   subDfxDftHilog0100
 * @tc.number SUB_DFX_DFT_Hilog_0100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  [CORRECT ME] INVALID TCLEVEL.
 */
LITE_TEST_CASE(DfxFuncTestSuite, subDfxDftHilog0100, LEVEL0)
{
    HILOG_DEBUG(HILOG_MODULE_HIVIEW, "debuglog test pass");
};


/**
 * @tc.name   subDfxDftHilog0200
 * @tc.number SUB_DFX_DFT_Hilog_0200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  [CORRECT ME] INVALID TCLEVEL.
 */
LITE_TEST_CASE(DfxFuncTestSuite, subDfxDftHilog0200, LEVEL1)
{
    HILOG_INFO(HILOG_MODULE_HIVIEW, "infolog test pass");
};

/**
 * @tc.name   subDfxDftHilog0300
 * @tc.number SUB_DFX_DFT_Hilog_0300
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  [CORRECT ME] INVALID TCLEVEL.
 */
LITE_TEST_CASE(DfxFuncTestSuite, subDfxDftHilog0300, LEVEL1)
{
    HILOG_WARN(HILOG_MODULE_HIVIEW, "warnlog test pass");
};

/**
 * @tc.name   subDfxDftHilog0400
 * @tc.number SUB_DFX_DFT_Hilog_0400
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  [CORRECT ME] INVALID TCLEVEL.
 */
LITE_TEST_CASE(DfxFuncTestSuite, subDfxDftHilog0400, LEVEL1)
{
    HILOG_ERROR(HILOG_MODULE_HIVIEW, "errorlog test pass");
};

/**
 * @tc.name   subDfxDftHilog0500
 * @tc.number SUB_DFX_DFT_Hilog_0500
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  [CORRECT ME] INVALID TCLEVEL.
 */
LITE_TEST_CASE(DfxFuncTestSuite, subDfxDftHilog0500, LEVEL1)
{
    HILOG_FATAL(HILOG_MODULE_HIVIEW, "fatallog test pass");
};

/**
 * @tc.name   subDfxDftHilog0600
 * @tc.number SUB_DFX_DFT_Hilog_0600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  [CORRECT ME] INVALID TCLEVEL.
 */
LITE_TEST_CASE(DfxFuncTestSuite, subDfxDftHilog0600, LEVEL0)
{
    BOOL ret = TRUE;
    ret = HiLogRegisterModule(HILOG_MODULE_HIVIEW, "HIVIEW");
    TEST_ASSERT_FALSE(ret);
};

/**
 * @tc.name   subDfxDftHilog0700
 * @tc.number SUB_DFX_DFT_Hilog_0700
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  [CORRECT ME] INVALID TCLEVEL.
 */
LITE_TEST_CASE(DfxFuncTestSuite, subDfxDftHilog0700, LEVEL0)
{
    const char * ret = HiLogGetModuleName(HILOG_MODULE_HIVIEW);
    TEST_ASSERT_EQUAL_STRING(ret, "HIVIEW"); 
};

RUN_TEST_SUITE(DfxFuncTestSuite);
