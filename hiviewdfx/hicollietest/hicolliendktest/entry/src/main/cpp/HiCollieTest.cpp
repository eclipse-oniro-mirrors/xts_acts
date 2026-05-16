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
#include "napi/native_api.h"
#include "HiCollieTest.h"
#include "hilog/log.h"
#include "hicollie/hicollie.h"
#include <atomic>
#include <thread>
#include <string>
#include <unistd.h>

#undef LOG_TAG
#define LOG_TAG "StruckTest"

// 设置上报应用线程卡死事件标志位
std::shared_ptr<std::atomic<bool>> isSixSecondEvent1_ = std::make_shared<std::atomic<bool>>(false);
int  g_suc = 1;
void ReportEvent1() {
    bool temp = isSixSecondEvent1_->load();
    g_suc = OH_HiCollie_Report(&temp);
    // 成功：0
    OH_LOG_INFO(LogType::LOG_APP, "OH_HiCollie_Report: %{public}d, isSixSecondEvent1: %{public}d", g_suc, isSixSecondEvent1_->load());
    isSixSecondEvent1_->store(temp);
    
}

napi_value OH_HiCollie_Report_sucess(napi_env env, napi_callback_info info)
{
    // 创建子线程
    std::thread threadObj(ReportEvent1);
    // 执行任务
    threadObj.join();
    napi_value sum;
    napi_create_int32(env, g_suc, &sum);
    return sum;

}
napi_value OH_HiCollie_Report_Main(napi_env env, napi_callback_info info)
{
    bool temp = isSixSecondEvent1_->load();
    int reportResult = OH_HiCollie_Report(&temp);
    OH_LOG_INFO(LogType::LOG_APP, "OH_HiCollie_Report: %{public}d, isSixSecondEvent1: %{public}d", reportResult, isSixSecondEvent1_->load());
    // 执行任务
    napi_value sum;
    napi_create_int32(env, reportResult, &sum);
    return sum;

}

napi_value OH_HiCollie_Report_Remote(napi_env env, napi_callback_info info)
{
    bool res = HiCollie_ErrorCode::HICOLLIE_REMOTE_FAILED == 29800002;
    napi_value ret = nullptr;
    napi_get_boolean(env, res, &ret);
    return ret;
}

napi_value OH_HiCollie_ReportInputBlock_Main(napi_env env, napi_callback_info info)
{
    int reportResult = OH_HiCollie_ReportInputBlock();
    OH_LOG_INFO(LogType::LOG_APP, "OH_HiCollie_ReportInputBlock: %{public}d", reportResult);
    // 执行任务
    napi_value sum;
    napi_create_int32(env, reportResult, &sum);
    return sum;
}
 
napi_value OH_HiCollie_ReportInputBlock_Remote(napi_env env, napi_callback_info info)
{
    bool result = HiCollie_ErrorCode::HICOLLIE_REMOTE_FAILED == 29800002;
    napi_value val = nullptr;
    napi_get_boolean(env, result, &val);
    return val;
}