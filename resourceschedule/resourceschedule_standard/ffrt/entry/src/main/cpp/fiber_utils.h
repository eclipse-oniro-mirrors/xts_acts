/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#ifndef FFRT_JOB_UTILS_H
#define FFRT_JOB_UTILS_H

#include <cstdint>
#include <functional>
#include <atomic>
#include "ffrt/fiber.h"

namespace ffrt {

namespace detail {
    struct NonCopyable {
    protected:
        NonCopyable() = default;
        ~NonCopyable() = default;
        NonCopyable(const NonCopyable&) = delete;
        NonCopyable& operator=(const NonCopyable&) = delete;
    };
}

template <int UsageId = 0, class FiberLocal = char, class ThreadLocal = char>
struct Fiber : detail::NonCopyable {
    struct ThreadEnv :  detail::NonCopyable {
        Fiber* cur = nullptr;
        bool (*cond)(void*) = nullptr;
        ThreadLocal tl;
    };

    static __attribute__((noinline)) ThreadEnv& Env()
    {
        static thread_local ThreadEnv ctx;
        return ctx;
    }

    static Fiber* Init(std::function<void()>&& f, void* stack, size_t stack_size)
    {
        if (stack == nullptr || stack_size < sizeof(Fiber) + minStackSize) {
            return nullptr;
        }
        auto c = new (stack) Fiber(std::forward<std::function<void()>>(f));
        if (ffrt_fiber_init(&c->fb, reinterpret_cast<void(*)(void*)>(FiberEntry), c,
            static_cast<char*>(stack) + sizeof(Fiber), stack_size - sizeof(Fiber))) {
            c->~Fiber<UsageId, FiberLocal, ThreadLocal>();
            return nullptr;
        }
        return c;
    }

    inline void Destroy()
    {
        this->~Fiber<UsageId, FiberLocal, ThreadLocal>();
    }

    bool Start()
    {
        bool currentDone;
        auto& e = Fiber::Env();

        do {
            e.cond = nullptr;
            e.cur = this;
            ffrt_fiber_switch(&link, &fb);
            currentDone = this->done;
        } while (e.cond && !(e.cond)(this));
        e.cond = nullptr;
        return currentDone;
    }

    template<bool is_final = false>
    static inline void Suspend(ThreadEnv& e, bool (*cond)(void*) = nullptr)
    {
        auto j = e.cur;
        if constexpr(is_final) {
            j->done = true;
        } else {
            e.cond = cond;
        }
        e.cur = nullptr;

        ffrt_fiber_switch(&j->fb, &j->link);
    }

    template<bool is_final = false>
    static inline void Suspend(bool (*cond)(void*) = nullptr)
    {
        Suspend<is_final>(Fiber::Env(), cond);
    }

    FiberLocal& Local()
    {
        return local_;
    }

    uint64_t id;

    static constexpr uint64_t minStackSize = 32;

    Fiber(std::function<void()>&& f)
    {
        fn = std::forward<std::function<void()>>(f);
        id = idx.fetch_add(1, std::memory_order_relaxed);
    }

    static void FiberEntry(Fiber* c)
    {
        c->fn();
        c->fn = nullptr;
        Suspend<true>();
    }

    ffrt_fiber_t fb;
    ffrt_fiber_t link;
    std::function<void()> fn;
    bool done = false;
    FiberLocal local_;
    static inline std::atomic_uint64_t idx{0};
};
}
#endif