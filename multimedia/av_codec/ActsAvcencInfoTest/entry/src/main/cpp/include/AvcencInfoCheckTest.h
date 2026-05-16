/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 */
#ifndef CENC_INFO_TEST_CASE_H
#define CENC_INFO_TEST_CASE_H

namespace OHOS {
    namespace CencInfoUT {

        int TestCencInfoCreate001();
        int TestCencInfoDestroy001();
        int TestCencInfoDestroy002();

        int TestCencInfoSetAlgorithm001();
        int TestCencInfoSetAlgorithm002();

        int TestCencInfoSetKeyIdAndIv001();
        int TestCencInfoSetKeyIdAndIv002();
        int TestCencInfoSetKeyIdAndIv003();
        int TestCencInfoSetKeyIdAndIv004();
        int TestCencInfoSetKeyIdAndIv005();
        int TestCencInfoSetKeyIdAndIv006();

        int TestCencInfoSetSubsampleInfo001();
        int TestCencInfoSetSubsampleInfo002();
        int TestCencInfoSetSubsampleInfo003();
        int TestCencInfoSetSubsampleInfo004();

        int TestCencInfoSetMode001();
        int TestCencInfoSetMode002();

        int TestCencInfoSetAVBuffer001();
        int TestCencInfoSetAVBuffer002();
        int TestCencInfoSetAVBuffer003();
    } // CencInfoUT
} // OHOS
#endif // CENC_INFO_TEST_CASE_H