/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef HUKS_AGREE_DH_TEST_H
#define HUKS_AGREE_DH_TEST_H

#include <string>
#include "huks_three_stage_test_common.h"
#include "native_huks_api.h"
#include "native_huks_param.h"
#include "native_huks_type.h"

namespace Unittest::DhAgree {
static const std::string g_inData = "OH_HUKS_DH_Agree_Test_00000000000000000000000000000000000000000000000000000000000000"
                                    "00000000000000000000000000000000000000000000000000000000000000000000000000000000"
                                    "0000000000000000000000000000000000000000000000000000000000000000000000000_string";
static const uint32_t DH_COMMON_SIZE = 2048;

static struct OH_Huks_Blob g_keyAlias01001 = {
    strlen("HksDHAgreeKeyAliasTest001_1"),
    (uint8_t *)"HksDHAgreeKeyAliasTest001_1"
};
static struct OH_Huks_Blob g_keyAlias02001 = {
    strlen("HksDHAgreeKeyAliasTest001_2"),
    (uint8_t *)"HksDHAgreeKeyAliasTest001_2"
};
static struct OH_Huks_Blob g_keyAliasFinal1001 = {
    strlen("HksDHAgreeKeyAliasTest001_1_final"),
    (uint8_t *)"HksDHAgreeKeyAliasTest001_1_final"
};
static struct OH_Huks_Blob g_keyAliasFinal2001 = {
    strlen("HksDHAgreeKeyAliasTest001_2_final"),
    (uint8_t *)"HksDHAgreeKeyAliasTest001_2_final"
};
static struct OH_Huks_Param g_genParams001[] = {
    {
        .tag = OH_HUKS_TAG_ALGORITHM,
        .uint32Param = OH_HUKS_ALG_DH
    }, {
        .tag = OH_HUKS_TAG_PURPOSE,
        .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE
    }, {
        .tag = OH_HUKS_TAG_KEY_SIZE,
        .uint32Param = OH_HUKS_DH_KEY_SIZE_2048
    }
};
static struct OH_Huks_Param g_agreeParams01Init001[] = {
    {
        .tag = OH_HUKS_TAG_ALGORITHM,
        .uint32Param = OH_HUKS_ALG_DH
    }, {
        .tag = OH_HUKS_TAG_PURPOSE,
        .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE
    }, {
        .tag = OH_HUKS_TAG_KEY_SIZE,
        .uint32Param = OH_HUKS_DH_KEY_SIZE_2048
    }
};
static struct OH_Huks_Param g_agreeParams01Finish001[] = {
    {
        .tag = OH_HUKS_TAG_KEY_STORAGE_FLAG,
        .uint32Param = OH_HUKS_STORAGE_PERSISTENT
    }, {
        .tag = OH_HUKS_TAG_IS_KEY_ALIAS,
        .boolParam = true
    }, {
        .tag = OH_HUKS_TAG_ALGORITHM,
        .uint32Param = OH_HUKS_ALG_AES
    }, {
        .tag = OH_HUKS_TAG_KEY_SIZE,
        .uint32Param = OH_HUKS_AES_KEY_SIZE_256
    }, {
        .tag = OH_HUKS_TAG_PURPOSE,
        .uint32Param = OH_HUKS_KEY_PURPOSE_DERIVE
    }, {
        .tag = OH_HUKS_TAG_DIGEST,
        .uint32Param = OH_HUKS_DIGEST_SHA256
    }, {
        .tag = OH_HUKS_TAG_KEY_ALIAS,
        .blob = g_keyAliasFinal1001
    }, {
        .tag = OH_HUKS_TAG_PADDING,
        .uint32Param = OH_HUKS_PADDING_NONE
    }, {
        .tag = OH_HUKS_TAG_BLOCK_MODE,
        .uint32Param = OH_HUKS_MODE_CBC
    }
};
static struct OH_Huks_Param g_agreeParams02Init001[] = {
    {
        .tag = OH_HUKS_TAG_ALGORITHM,
        .uint32Param = OH_HUKS_ALG_DH
    }, {
        .tag = OH_HUKS_TAG_PURPOSE,
        .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE
    }, {
        .tag = OH_HUKS_TAG_KEY_SIZE,
        .uint32Param = OH_HUKS_DH_KEY_SIZE_2048
    }
};
static struct OH_Huks_Param g_agreeParams02Finish001[] = {
    {
        .tag = OH_HUKS_TAG_KEY_STORAGE_FLAG,
        .uint32Param = OH_HUKS_STORAGE_PERSISTENT
    }, {
        .tag = OH_HUKS_TAG_IS_KEY_ALIAS,
        .boolParam = true
    }, {
        .tag = OH_HUKS_TAG_ALGORITHM,
        .uint32Param = OH_HUKS_ALG_AES
    }, {
        .tag = OH_HUKS_TAG_KEY_SIZE,
        .uint32Param = OH_HUKS_AES_KEY_SIZE_256
    }, {
        .tag = OH_HUKS_TAG_PURPOSE,
        .uint32Param = OH_HUKS_KEY_PURPOSE_DERIVE
    }, {
        .tag = OH_HUKS_TAG_DIGEST,
        .uint32Param = OH_HUKS_DIGEST_SHA256
    }, {
        .tag = OH_HUKS_TAG_KEY_ALIAS,
        .blob = g_keyAliasFinal2001
    }, {
        .tag = OH_HUKS_TAG_PADDING,
        .uint32Param = OH_HUKS_PADDING_NONE
    }, {
        .tag = OH_HUKS_TAG_BLOCK_MODE,
        .uint32Param = OH_HUKS_MODE_CBC
    }
};
int Security_HUKS_NAPI_Agree_DH_0100(void);
} // namespace Unittest::DhAgree
#endif // HUKS_AGREE_DH_TEST_H