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
 
#include "backtrace.h"
#include "hidebug/hidebug.h"
#include "hilog/log.h"
#include <condition_variable>
#include <csignal>
#include <sys/syscall.h>
#include <unistd.h>


#define MAX_FRAME_SIZE 256 // 最大栈回溯深度，应根据业务场景调整该值。
namespace {
constexpr auto LOG_PRINT_DOMAIN = 0xFF00;
} // namespace

class BackTraceObject {
public:
    static BackTraceObject &GetInstance();
    BackTraceObject(const BackTraceObject &) = delete;
    BackTraceObject &operator=(const BackTraceObject &) = delete;
    BackTraceObject(BackTraceObject &&) = delete;
    BackTraceObject &operator=(BackTraceObject &&) = delete;
    bool Init(uint32_t size);
    void Release();
    int BackTraceFromFp(void *startFp, int size);
    void SymbolicAddress(int index);
    void SymbolicInvalidAddress(int index);
    void PrintStackFrame(void *pc, const HiDebug_StackFrame &frame);

private:
    BackTraceObject() = default;
    ~BackTraceObject() = default;
    HiDebug_Backtrace_Object backtraceObject_ = nullptr;
    void **pcs_ = nullptr;
};

BackTraceObject &BackTraceObject::GetInstance() 
{
    static BackTraceObject instance;
    return instance;
}

bool BackTraceObject::Init(uint32_t size) // 初始化，申请资源。
{
    backtraceObject_ = OH_HiDebug_CreateBacktraceObject();
    if (backtraceObject_ == nullptr) {
        return false;
    }
    pcs_ = new (std::nothrow) void *[MAX_FRAME_SIZE] { nullptr };
    if (pcs_ == nullptr) {
        return false;
    }
    return true;
}

void BackTraceObject::Release() // 释放栈回溯及栈解析的资源。
{
    OH_HiDebug_DestroyBacktraceObject(backtraceObject_);
    backtraceObject_ = nullptr;
    delete[] pcs_;
    pcs_ = nullptr;
}

int BackTraceObject::BackTraceFromFp(void *startFp, int size) 
{
    if (size <= MAX_FRAME_SIZE) {
        return OH_HiDebug_BacktraceFromFp(backtraceObject_, startFp, pcs_, size);
    }
    return 0;
}

void BackTraceObject::PrintStackFrame(void *pc, const HiDebug_StackFrame &frame) 
{
    if (frame.type == HIDEBUG_STACK_FRAME_TYPE_JS) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTag",
                     "js stack frame info for pc: %{public}p is "
                     "relativePc: %{public}p "
                     "line: %{public}d "
                     "column: %{public}d "
                     "mapName: %{public}s "
                     "functionName: %{public}s "
                     "url: %{public}s "
                     "packageName: %{public}s.",
                     pc, reinterpret_cast<void *>(frame.frame.js.relativePc), frame.frame.js.line,
                     frame.frame.js.column, frame.frame.js.mapName, frame.frame.js.functionName, frame.frame.js.url,
                     frame.frame.js.packageName);
    } else {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTag",
                     "native stack frame info for pc: %{public}p is "
                     "relativePc: %{public}p "
                     "funcOffset: %{public}p "
                     "mapName: %{public}s "
                     "functionName: %{public}s "
                     "buildId: %{public}s "
                     "reserved: %{public}s.",
                     pc, reinterpret_cast<void *>(frame.frame.native.relativePc),
                     reinterpret_cast<void *>(frame.frame.native.funcOffset), frame.frame.native.mapName,
                     frame.frame.native.functionName, frame.frame.native.buildId, frame.frame.native.reserved);
    }
}

void BackTraceObject::SymbolicAddress(int index) 
{
    if (index < 0 || index >= MAX_FRAME_SIZE) {
        return;
    }
    OH_HiDebug_SymbolicAddress(backtraceObject_, pcs_[index], this,
                               [](void *pc, void *arg, const HiDebug_StackFrame *frame) {
                                   reinterpret_cast<BackTraceObject *>(arg)->PrintStackFrame(pc, *frame);
                               });
}

void BackTraceObject::SymbolicInvalidAddress(int index) {
    if (index < 0 || index >= MAX_FRAME_SIZE) {
        return;
    }
    int i = OH_HiDebug_SymbolicAddress(backtraceObject_,  reinterpret_cast<BackTraceObject *>(0x0001), this,
                               [](void *pc, void *arg, const HiDebug_StackFrame *frame) {
                                   reinterpret_cast<BackTraceObject *>(arg)->PrintStackFrame(pc, *frame);
                               });
    OH_LOG_Print(LOG_APP, LOG_WARN, LOG_PRINT_DOMAIN, "TestTag", "return error code %{public}d", i);
}


void BackTraceCurrentThread()
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTag", "start  BackTraceCurrentThread");
    BackTraceObject::GetInstance().Init(MAX_FRAME_SIZE);
    auto pcSize2 = BackTraceObject::GetInstance().BackTraceFromFp(__builtin_frame_address(0), MAX_FRAME_SIZE);
    for (int i = 0; i < pcSize2; i++) {
        BackTraceObject::GetInstance().SymbolicAddress(i); // 栈解析。
    }
    BackTraceObject::GetInstance().Release();
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTag", "end  BackTraceCurrentThread");
}

void InvaildBackTraceCurrentThread()
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTag", "start  BackTraceCurrentThread");
    BackTraceObject::GetInstance().Init(MAX_FRAME_SIZE);
    auto pcSize2 = BackTraceObject::GetInstance().BackTraceFromFp(__builtin_frame_address(0), MAX_FRAME_SIZE);
    for (int i = 0; i < pcSize2; i++) {
        BackTraceObject::GetInstance().SymbolicInvalidAddress(i); // 栈解析。
    }
    BackTraceObject::GetInstance().Release();
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTag", "end  BackTraceCurrentThread");
}