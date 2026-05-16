/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

#include <search.h>
#include "functionalext.h"

const size_t SIZE = 2;

/**
 * @tc.name      : Hdestroy0100
 * @tc.desc      : Verify hdestroy process success
 * @tc.level     : Level 0
 */
void Hdestroy0100(void)
{
    struct hsearch_data hData = {};
    int ret;
    EXPECT_NE("Hdestroy0100", hcreate(SIZE), 0);
    hdestroy();
}

static int HdestroyTestImpl(void)
{
    Hdestroy0100();
    return T_STATUS;
}

int HdestroyTest(void)
{
    return HdestroyTestImpl();
}
