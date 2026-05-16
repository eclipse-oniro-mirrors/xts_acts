/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#ifndef APP_GAMECONTROLLER_TEST_GAME_CONTROLLER_REAL_TEST_H
#define APP_GAMECONTROLLER_TEST_GAME_CONTROLLER_REAL_TEST_H

#include <cstdint>

namespace OHOS {
namespace GameController {
/**
 * 连接设备进行真实测试
 * @return 测试结果，0表示成功，其他表示失败
 */
int32_t ActsRealDeviceGetAllDevices();

/**
 * 是否有真实的设备
 * @return 0表示没有，1表示有
 */
int32_t ActsRealDeviceHasRealDevice();

/**
 * 检查设备回调事件
 * @return 0表示检查成功；1表示检查失败
 */
int32_t ActsRealDeviceCheckDeviceEvent();

/**
 * 检查GamePad事件回调
 * @return 0表示检查成功；1表示检查失败
 */
int32_t ActsRealDeviceCheckGamePadEvent();
}
}
#endif //APP_GAMECONTROLLER_TEST_GAME_CONTROLLER_REAL_TEST_H
