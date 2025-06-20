/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef NATIVE_XCOMPONENT_TIMER_H
#define NATIVE_XCOMPONENT_TIMER_H

#include <iostream>
#include <chrono>
#include <thread>
#include <future>
#include <atomic>
#include <functional>

class Timer {
public:
    Timer() : is_running(false)
    {}

    void start(std::chrono::milliseconds total_duration, std::chrono::milliseconds interval, std::function<void()> task)
    {
        stop();  // 确保之前的计时器停止
        is_running = true;
        timer_future = std::async(std::launch::async, [=]() {
            auto start_time = std::chrono::steady_clock::now();
            auto end_time = start_time + total_duration;
            auto next_check = start_time;

            while (is_running.load() && std::chrono::steady_clock::now() < end_time) {
                std::this_thread::sleep_until(next_check);
                next_check += interval;
                if (is_running.load()) {
                    task();
                }
            }
            is_running = false;  // 确保在结束时将 is_running 设置为 false
        });
    }

    void stop()
    {
        is_running = false;
        if (timer_future.valid()) {
            timer_future.wait();
        }
    }

    ~Timer()
    {
        stop();
    }

private:
    std::atomic<bool> is_running;
    std::future<void> timer_future;
};

#endif  // NATIVE_XCOMPONENT_TIMER_H
