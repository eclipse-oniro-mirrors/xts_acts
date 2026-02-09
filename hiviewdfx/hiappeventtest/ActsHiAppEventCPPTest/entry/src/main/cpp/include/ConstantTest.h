/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

#ifndef TEST_CONSTANTS_H
#define TEST_CONSTANTS_H

namespace TestConstants {
    // 事件类型常量
    constexpr int EVENT_TYPE_FAULT = 1;
    constexpr int EVENT_TYPE_STATISTIC = 2;
    constexpr int EVENT_TYPE_SECURITY = 3;
    constexpr int EVENT_TYPE_BEHAVIOR = 4;

    // 超时时间常量
    constexpr int WATCHER_TIMEOUT_SECONDS = 3;
    constexpr int SLEEP_ONE_SECOND = 1;

    // 参数数量限制
    constexpr int MAX_PARAM_COUNT = 32;
    constexpr int MIN_PARAM_COUNT = 0;

    // 数组大小常量
    constexpr int BOOL_ARRAY_SIZE = 2;
    constexpr int STRING_ARRAY_SIZE = 2;
    constexpr int DOUBLE_ARRAY_SIZE = 2;
    constexpr int INT_ARRAY_SIZE = 2;

    // 配置值常量
    constexpr const char* STORAGE_QUOTA_10M = "10M";
    constexpr const char* STORAGE_QUOTA_1M = "1M";
    constexpr const char* CONFIG_KEY_MAX_STORAGE = "max_storage";

    // 主线程卡顿配置常量
    constexpr const char* JANK_LOG_TYPE_VALUE = "1";
    constexpr const char* JANK_IGNORE_STARTUP_TIME = "10";
    constexpr const char* JANK_SAMPLE_INTERVAL = "100";
    constexpr const char* JANK_REPORT_TIMES = "3";
    constexpr const char* JANK_SAMPLE_COUNT = "21";
    constexpr const char* JANK_AUTO_STOP_TRUE = "true";
    constexpr const char* JANK_AUTO_STOP_FALSE = "false";

    // Processor 配置常量
    constexpr int PROCESSOR_REPORT_PERIOD = 10;
    constexpr int PROCESSOR_REPORT_PACKAGE_NUM = 5;
    constexpr int PROCESSOR_CONFIG_ID = 123;
    
    // API 返回值常量
    constexpr int RETURN_PARAM_LIMIT_WARNING = 5;  // 参数数量超限警告
    constexpr int RETURN_STRING_TOO_LONG = 4;      // 字符串过长
    constexpr int RETURN_WRITE_DISABLED = -99;     // 事件写入被禁用
    constexpr int RETURN_ARRAY_TRUNCATED = 6;      // 数组被截断警告
    
    // 数组大小常量
    constexpr int ARRAY_SIZE_100 = 100;

    // 测试用例编号常量
    constexpr int TEST_CASE_0100 = 100;
    constexpr int TEST_CASE_0200 = 200;
    constexpr int TEST_CASE_3500 = 3500;
    constexpr int TEST_CASE_3600 = 3600;
    constexpr int TEST_CASE_4400 = 4400;
    constexpr int TEST_CASE_4500 = 4500;
}

#endif // TEST_CONSTANTS_H
