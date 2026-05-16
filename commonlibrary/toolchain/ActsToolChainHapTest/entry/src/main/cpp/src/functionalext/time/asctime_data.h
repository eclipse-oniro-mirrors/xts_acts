/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
#ifndef __ASCTIME_DATA_H__
#define __ASCTIME_DATA_H__
#include "time_test_data.h"
inline constexpr TimeTestStringStruct TEST_ASCTIME_DATA[] = {
    { "Europe/Moscow", "Sat Jul 30 13:40:14 2022" },
    { "Asia/Novokuznetsk", "Sat Jul 30 17:40:14 2022" },
    { "Asia/Magadan", "Sat Jul 30 21:40:14 2022" },
    { "Europe/Kaliningrad", "Sat Jul 30 12:40:14 2022" },
    { "Europe/Samara", "Sat Jul 30 14:40:14 2022" }
};

#define test_asctime_data TEST_ASCTIME_DATA
#endif
