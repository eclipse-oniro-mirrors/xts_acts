/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

#ifndef ARKTS_ANI_TEST_ATTACHDETACHTEST_H
#define ARKTS_ANI_TEST_ATTACHDETACHTEST_H

#include "Common.h"
#include <atomic>
#include <thread>
#include "hilog/log.h"

ani_int test_AttachDetach([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_AttachDetach GetVM failed");
        return ANI_FALSE;
    }
    ani_env *mainEnv = nullptr;
    ani_options mainoptions {0, nullptr};
    ani_status mainstatus = vm->AttachCurrentThread(&mainoptions, ANI_VERSION_1, &mainEnv);
    if (mainstatus == ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : AttachCurrentThread in main thread should failed, but successed here!");
        return ANI_FALSE;
    }

    std::atomic<ani_int> result(ANI_FALSE);

    std::thread worker([&result, vm]() {
        ani_env *workerEnv = nullptr;
        ani_options options {0, nullptr};

        ani_status status = vm->AttachCurrentThread(&options, ANI_VERSION_1, &workerEnv);
        if (status != ANI_OK || workerEnv == nullptr) {
            OH_LOG_INFO(LOG_APP, "testTag : AttachCurrentThread failed, status=%{public}d", status);
            result.store(ANI_FALSE);
            return;
        }

        ani_vm *testVm = nullptr;
        if (workerEnv->GetVM(&testVm) != ANI_OK || testVm == nullptr) {
            OH_LOG_INFO(LOG_APP, "testTag : workerEnv GetVM failed");
            vm->DetachCurrentThread();
            result.store(ANI_FALSE);
            return;
        }

        status = vm->DetachCurrentThread();
        if (status != ANI_OK) {
            OH_LOG_INFO(LOG_APP, "testTag : DetachCurrentThread failed, status=%{public}d", status);
            result.store(ANI_FALSE);
            return;
        }

        result.store(ANI_TRUE);
        OH_LOG_INFO(LOG_APP, "testTag : Attach/Detach test succeeded");
    });

    worker.join();
    return result.load();
}

ani_int test_AttachDetach_WithInterop([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_AttachDetach_WithInterop GetVM failed");
        return ANI_FALSE;
    }
    ani_env *mainEnv = nullptr;
    ani_option maininteropEnabled = {"--interop=enable", nullptr};
    ani_options mainoptions {1, &maininteropEnabled};
    ani_status mainstatus = vm->AttachCurrentThread(&mainoptions, ANI_VERSION_1, &mainEnv);
    if (mainstatus == ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : AttachCurrentThread in main thread should failed, but successed here!");
        return ANI_FALSE;
    }

    std::atomic<ani_int> result(ANI_FALSE);

    std::thread worker([&result, vm]() {
        ani_env *workerEnv = nullptr;
        ani_option interopEnabled = {"--interop=enable", nullptr};
        ani_options options {1, &interopEnabled};

        ani_status status = vm->AttachCurrentThread(&options, ANI_VERSION_1, &workerEnv);
        if (status != ANI_OK || workerEnv == nullptr) {
            OH_LOG_INFO(LOG_APP, "testTag : AttachCurrentThread with interop failed, status=%{public}d", status);
            result.store(ANI_FALSE);
            return;
        }

        ani_vm *testVm = nullptr;
        if (workerEnv->GetVM(&testVm) != ANI_OK || testVm == nullptr) {
            OH_LOG_INFO(LOG_APP, "testTag : workerEnv GetVM with interop failed");
            vm->DetachCurrentThread();
            result.store(ANI_FALSE);
            return;
        }

        status = vm->DetachCurrentThread();
        if (status != ANI_OK) {
            OH_LOG_INFO(LOG_APP, "testTag : DetachCurrentThread with interop failed, status=%{public}d", status);
            result.store(ANI_FALSE);
            return;
        }

        result.store(ANI_TRUE);
        OH_LOG_INFO(LOG_APP, "testTag : Attach/Detach with interop test succeeded");
    });

    worker.join();
    return result.load();
}

ani_int test_ConcurrentAttach([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_ConcurrentAttach GetVM failed");
        return ANI_FALSE;
    }

    const int THREAD_COUNT = 10;
    std::atomic<int> successCount(0);
    std::atomic<int> failCount(0);
    std::atomic<bool> startFlag(false);

    ani_class maincls;
    ani_method constructor;
    if (env->FindClass("entry.src.main.src.ets.Index.TestClass", &maincls) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : mainThread FindClass failed");
        return ANI_FALSE;
    }

    if (env->Class_FindMethod(maincls, "<ctor>", ":", &constructor) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : mainThread FindConstructor failed");
        return ANI_FALSE;
    }

    ani_object mainTestObj;
    ani_ref g_objectref;
    if (env->Object_New(maincls, constructor, &mainTestObj) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : mainThread Object_New failed");
        return ANI_FALSE;
    }
    if (env->GlobalReference_Create(mainTestObj, &g_objectref) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : mainThread GlobalReference_Create failed");
        return ANI_FALSE;
    }
    
    ani_int sumResult;
    if (env->Object_CallMethodByName_Int(mainTestObj, "sum", "ii:i", &sumResult, 3,4) != ANI_OK || sumResult != 7) {
        OH_LOG_INFO(LOG_APP, "testTag : mainThread sum method failed");
        return ANI_FALSE;
    }

    std::vector<std::thread> threads;

    for (int i = 0; i < THREAD_COUNT; i++) {
        bool useInterop = (i >= THREAD_COUNT / 2);
        threads.emplace_back([vm, &g_objectref, &successCount, &failCount, &startFlag, useInterop, i]() {
            while (!startFlag.load()) {
                std::this_thread::yield();
            }

            ani_env *workerEnv = nullptr;
            ani_status status;

            if (useInterop) {
                ani_option interopEnabled = {"--interop=enable", nullptr};
                ani_options options {1, &interopEnabled};
                status = vm->AttachCurrentThread(&options, ANI_VERSION_1, &workerEnv);
            } else {
                ani_options options {0, nullptr};
                status = vm->AttachCurrentThread(&options, ANI_VERSION_1, &workerEnv);
            }

            if (status != ANI_OK || workerEnv == nullptr) {
                OH_LOG_INFO(LOG_APP, "testTag : Thread %d Attach failed, status=%{public}d", i, status);
                failCount++;
                return;
            }

            ani_vm *testVm = nullptr;
            if (workerEnv->GetVM(&testVm) != ANI_OK) {
                OH_LOG_INFO(LOG_APP, "testTag : Thread %d GetVM failed", i);
                vm->DetachCurrentThread();
                failCount++;
                return;
            }
        
            ani_value args[2U];
            args[0U].i = 3;
            args[1U].i = 4;
            ani_int sumResult;
            if (workerEnv->Object_CallMethodByName_Int(static_cast<ani_object>(g_objectref), "sum", "ii:i", &sumResult, 3,4) != ANI_OK || sumResult != 7) {
                OH_LOG_INFO(LOG_APP, "testTag : Thread %d sum method failed", i);
                vm->DetachCurrentThread();
                failCount++;
                return;
            }

            if (vm->DetachCurrentThread() != ANI_OK) {
                OH_LOG_INFO(LOG_APP, "testTag : Thread %d Detach failed", i);
                failCount++;
                return;
            }

            OH_LOG_INFO(LOG_APP, "testTag : Thread %d completed successfully (interop=%{public}d)", i, useInterop);
            successCount++;
        });
    }

    startFlag.store(true);
    for (auto& t : threads) {
        t.join();
    }
    
    env->GlobalReference_Delete(g_objectref);
    g_objectref = nullptr;

    if (successCount == THREAD_COUNT && failCount == 0) {
        OH_LOG_INFO(LOG_APP, "testTag : ConcurrentAttach test passed, success=%{public}d, fail=%{public}d",
                    successCount.load(), failCount.load());
        return ANI_TRUE;
    } else {
        OH_LOG_INFO(LOG_APP, "testTag : ConcurrentAttach test failed, success=%{public}d, fail=%{public}d",
                    successCount.load(), failCount.load());
        return ANI_FALSE;
    }
}

ani_int test_ConcurrentMainThreadWorker([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref g_testClassRef = nullptr;
    ani_method g_sumMethod = nullptr;
    
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_ConcurrentMainThreadWorker GetVM failed");
        return ANI_FALSE;
    }
    
    if (g_testClassRef != nullptr && env != nullptr) {
        env->GlobalReference_Delete(g_testClassRef);
        g_testClassRef = nullptr;
    }
    
    std::atomic<bool> startFlag(false);
    std::atomic<int> workerSuccess(0);
    std::atomic<int> mainSuccess(0);
    
    ani_class cls;
    ani_method constructor;
    ani_object testObj;
    
    if (env->FindClass("entry.src.main.src.ets.Index.TestClass", &cls) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : mainThread FindClass failed");
        return ANI_FALSE;
    }
    
    if (env->Class_FindMethod(cls, "<ctor>", ":", &constructor) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : mainThread FindConstructor failed");
        return ANI_FALSE;
    }
    
    if (env->Object_New(cls, constructor, &testObj) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : mainThread Object_New failed");
        return ANI_FALSE;
    }
    
    if (env->Class_FindMethod(cls, "sum", "ii:i", &g_sumMethod) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : mainThread FindMethod failed");
        return ANI_FALSE;
    }
    
    if (env->GlobalReference_Create(testObj, &g_testClassRef) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : mainThread GlobalReference_Create failed");
        return ANI_FALSE;
    }
    
    ani_int sumResult;
    if (env->Object_CallMethod_Int(testObj, g_sumMethod, &sumResult, 7, 8) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : mainThread Object_CallMethod_Int failed");
        return ANI_FALSE;
    }
    
    if (sumResult != 15) {
        OH_LOG_INFO(LOG_APP, "testTag : mainThread got wrong sum result: %{public}d", sumResult);
        return ANI_FALSE;
    }
    
    mainSuccess++;
    
    std::thread worker([&vm, &g_testClassRef, &startFlag, &workerSuccess]() {
        while (!startFlag.load()) {
            std::this_thread::yield();
        }
        
        ani_env *workerEnv = nullptr;
        ani_options options {0, nullptr};
        if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &workerEnv) != ANI_OK) {
            OH_LOG_INFO(LOG_APP, "testTag : Worker Attach failed");
            return;
        }
        
        ani_object obj = static_cast<ani_object>(g_testClassRef);
        
        ani_int workerSumResult;
        if (workerEnv->Object_CallMethodByName_Int(obj, "sum", "ii:i", &workerSumResult, 5, 6) != ANI_OK) {
            OH_LOG_INFO(LOG_APP, "testTag : Worker Object_CallMethodByName_Int failed");
            vm->DetachCurrentThread();
            return;
        }
        
        if (workerSumResult != 11) {
            OH_LOG_INFO(LOG_APP, "testTag : Worker got wrong sum result: %{public}d", workerSumResult);
            vm->DetachCurrentThread();
            return;
        }
        
        vm->DetachCurrentThread();
        workerSuccess++;
    });
    
    startFlag.store(true);
    worker.join();
    env->GlobalReference_Delete(g_testClassRef);
    g_testClassRef = nullptr;
    
    if (workerSuccess == 1 && mainSuccess == 1) {
        OH_LOG_INFO(LOG_APP, "testTag : ConcurrentMainThreadWorker test passed");
        return ANI_TRUE;
    } else {
        OH_LOG_INFO(LOG_APP, "testTag : ConcurrentMainThreadWorker test failed, worker=%{public}d, main=%{public}d",
                    workerSuccess.load(), mainSuccess.load());
        return ANI_FALSE;
    }
    
}

ani_int test_Detach_WithoutAttach([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Detach_WithoutAttach GetVM failed");
        return ANI_FALSE;
    }

    std::atomic<ani_int> result(ANI_FALSE);

    std::thread worker([&result, vm]() {
        ani_status status = vm->DetachCurrentThread();
        if (status == ANI_ERROR) {
            OH_LOG_INFO(LOG_APP, "testTag : DetachCurrentThread without attach returned ANI_ERROR as expected");
            result.store(ANI_TRUE);
        } else {
            OH_LOG_INFO(LOG_APP, "testTag : DetachCurrentThread without attach returned unexpected status=%{public}d", status);
            result.store(ANI_FALSE);
        }
    });

    worker.join();
    return result.load();
}

ani_int test_Attach_RepeatAttach([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Attach_RepeatAttach GetVM failed");
        return ANI_FALSE;
    }

    std::atomic<ani_int> result(ANI_FALSE);

    std::thread worker([&result, vm]() {
        ani_env *workerEnv1 = nullptr;
        ani_options options {0, nullptr};

        ani_status status = vm->AttachCurrentThread(&options, ANI_VERSION_1, &workerEnv1);
        if (status != ANI_OK || workerEnv1 == nullptr) {
            OH_LOG_INFO(LOG_APP, "testTag : First AttachCurrentThread failed, status=%{public}d", status);
            result.store(ANI_FALSE);
            return;
        }

        ani_env *workerEnv2 = nullptr;
        status = vm->AttachCurrentThread(&options, ANI_VERSION_1, &workerEnv2);
        if (status == ANI_ERROR) {
            OH_LOG_INFO(LOG_APP, "testTag : Second AttachCurrentThread returned ANI_ERROR as expected");
            vm->DetachCurrentThread();
            result.store(ANI_TRUE);
        } else {
            OH_LOG_INFO(LOG_APP, "testTag : Second AttachCurrentThread returned unexpected status=%{public}d", status);
            vm->DetachCurrentThread();
            result.store(ANI_FALSE);
        }
    });

    worker.join();
    return result.load();
}

ani_int test_Attach_RepeatDetach([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Attach_RepeatDetach GetVM failed");
        return ANI_FALSE;
    }

    std::atomic<ani_int> result(ANI_FALSE);

    std::thread worker([&result, vm]() {
        ani_env *workerEnv = nullptr;
        ani_options options {0, nullptr};

        ani_status status = vm->AttachCurrentThread(&options, ANI_VERSION_1, &workerEnv);
        if (status != ANI_OK || workerEnv == nullptr) {
            OH_LOG_INFO(LOG_APP, "testTag : AttachCurrentThread failed, status=%{public}d", status);
            result.store(ANI_FALSE);
            return;
        }

        status = vm->DetachCurrentThread();
        if (status != ANI_OK) {
            OH_LOG_INFO(LOG_APP, "testTag : First DetachCurrentThread failed, status=%{public}d", status);
            result.store(ANI_FALSE);
            return;
        }

        status = vm->DetachCurrentThread();
        if (status == ANI_ERROR) {
            OH_LOG_INFO(LOG_APP, "testTag : Second DetachCurrentThread returned ANI_ERROR as expected");
            result.store(ANI_TRUE);
        } else {
            OH_LOG_INFO(LOG_APP, "testTag : Second DetachCurrentThread returned unexpected status=%{public}d", status);
            result.store(ANI_FALSE);
        }
    });

    worker.join();
    return result.load();
}

ani_int test_Attach_InvalidResult([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Attach_InvalidResult GetVM failed");
        return ANI_FALSE;
    }

    std::atomic<ani_int> result(ANI_FALSE);

    std::thread worker([&result, vm]() {
        ani_options options {0, nullptr};

        ani_status status = vm->AttachCurrentThread(&options, ANI_VERSION_1, nullptr);
        if (status == ANI_INVALID_ARGS) {
            OH_LOG_INFO(LOG_APP, "testTag : AttachCurrentThread with nullptr result returned ANI_INVALID_ARGS as expected");
            result.store(ANI_TRUE);
        } else {
            OH_LOG_INFO(LOG_APP, "testTag : AttachCurrentThread with nullptr result returned unexpected status=%{public}d", status);
            result.store(ANI_FALSE);
        }
    });

    worker.join();
    return result.load();
}

ani_int test_Attach_InvalidVersion([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Attach_InvalidVersion GetVM failed");
        return ANI_FALSE;
    }

    std::atomic<ani_int> result(ANI_FALSE);

    std::thread worker([&result, vm]() {
        ani_env *workerEnv = nullptr;
        ani_options options {0, nullptr};

        ani_status status = vm->AttachCurrentThread(&options, 0, &workerEnv);
        if (status == ANI_INVALID_VERSION) {
            OH_LOG_INFO(LOG_APP, "testTag : AttachCurrentThread with invalid version returned ANI_INVALID_VERSION as expected");
            result.store(ANI_TRUE);
        } else {
            OH_LOG_INFO(LOG_APP, "testTag : AttachCurrentThread with invalid version returned unexpected status=%{public}d", status);
            result.store(ANI_FALSE);
        }
    });

    worker.join();
    return result.load();
}

ani_ref g_globalObject = nullptr;

ani_int test_Attach_InvalidOption([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Attach_InvalidOption GetVM failed");
        return ANI_FALSE;
    }

    std::atomic<ani_int> result(ANI_FALSE);

    std::thread worker([&result, vm]() {
        ani_env *workerEnv = nullptr;
        ani_option invalidOption = {"--invalid-option", nullptr};
        ani_options options {1, &invalidOption};

        ani_status status = vm->AttachCurrentThread(&options, ANI_VERSION_1, &workerEnv);
        if (status == ANI_OK && workerEnv != nullptr) {
            OH_LOG_INFO(LOG_APP, "testTag : AttachCurrentThread with invalid option succeeded (invalid option ignored) as expected");
            vm->DetachCurrentThread();
            result.store(ANI_TRUE);
        } else {
            OH_LOG_INFO(LOG_APP, "testTag : AttachCurrentThread with invalid option returned unexpected status=%{public}d", status);
            result.store(ANI_FALSE);
        }
    });

    worker.join();
    return result.load();
}

ani_int test_CreateObjectInWorker([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref g_testClassRef = nullptr;
    ani_method g_sumMethod = nullptr;
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_CreateObjectInWorker GetVM failed");
        return ANI_FALSE;
    }
    
    if (g_testClassRef != nullptr && env != nullptr) {
        env->GlobalReference_Delete(g_testClassRef);
        g_testClassRef = nullptr;
    }

    ani_class cls;
    ani_method constructor;
    ani_object testObj;
    
    if (env->FindClass("entry.src.main.src.ets.Index.TestClass", &cls) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : mainThread FindClass failed");
        return ANI_FALSE;
    }
    
    if (env->Class_FindMethod(cls, "<ctor>", ":", &constructor) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : mainThread FindConstructor failed");
        return ANI_FALSE;
    }
    
    if (env->Object_New(cls, constructor, &testObj) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : mainThread Object_New failed");
        return ANI_FALSE;
    }

    if (env->GlobalReference_Create(testObj, &g_testClassRef) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : mainThread GlobalReference_Create failed");
        return ANI_FALSE;
    }

    std::atomic<ani_int> result(ANI_FALSE);
    std::atomic<bool> workerDone(false);

    std::thread worker([&result, &g_testClassRef, vm, &workerDone]() {
        ani_env *workerEnv = nullptr;
        ani_options options {0, nullptr};

        ani_status status = vm->AttachCurrentThread(&options, ANI_VERSION_1, &workerEnv);
        if (status != ANI_OK || workerEnv == nullptr) {
            OH_LOG_INFO(LOG_APP, "testTag : Worker Attach failed");
            workerDone.store(true);
            return;
        }

        ani_ref ref;
        if (workerEnv->Object_CallMethodByName_Ref(static_cast<ani_object>(g_testClassRef), "newClass", ":C{entry.src.main.src.ets.Index.TestClass}",&ref) != ANI_OK) {
            OH_LOG_INFO(LOG_APP, "testTag : Worker CallMethodByName_Ref failed");
            vm->DetachCurrentThread();
            workerDone.store(true);
            return;
        }

        ani_object obj = static_cast<ani_object>(ref);

        ani_ref globalRef;
        if (workerEnv->GlobalReference_Create(obj, &globalRef) != ANI_OK) {
            OH_LOG_INFO(LOG_APP, "testTag : GlobalReference_Create failed");
            vm->DetachCurrentThread();
            workerDone.store(true);
            return;
        }

        g_globalObject = globalRef;

        vm->DetachCurrentThread();
        workerDone.store(true);
        result.store(ANI_TRUE);
    });

    worker.join();

    if (!result.load()) {
        OH_LOG_INFO(LOG_APP, "testTag : Worker thread failed");
        return ANI_FALSE;
    }

    while (!workerDone.load()) {
        std::this_thread::yield();
    }

    if (g_globalObject == nullptr) {
        OH_LOG_INFO(LOG_APP, "testTag : Global object is null");
        return ANI_FALSE;
    }

    ani_object workerCreatedObj = static_cast<ani_object>(g_globalObject);

    if (env->FindClass("entry.src.main.src.ets.Index.TestClass", &cls) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : Main thread FindClass failed");
        return ANI_FALSE;
    }

    ani_method sumMethod;
    if (env->Class_FindMethod(cls, "sum", "ii:i", &sumMethod) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : Main thread FindMethod failed");
        return ANI_FALSE;
    }

    ani_int sumResult;
    if (env->Object_CallMethod_Int(workerCreatedObj, sumMethod, &sumResult, 10, 20) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : Main thread CallMethod failed");
        return ANI_FALSE;
    }

    if (sumResult != 30) {
        OH_LOG_INFO(LOG_APP, "testTag : Main thread got wrong sum result: %{public}d", sumResult);
        return ANI_FALSE;
    }

    OH_LOG_INFO(LOG_APP, "testTag : Cross-thread object usage succeeded");

    if (env->GlobalReference_Delete(g_globalObject) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : DeleteGlobalRef failed");
        return ANI_FALSE;
    }

    g_globalObject = nullptr;

    OH_LOG_INFO(LOG_APP, "testTag : test_CreateObjectInWorker passed");
    return ANI_TRUE;
}

#endif //ARKTS_ANI_TEST_ATTACHDETACHTEST_H
