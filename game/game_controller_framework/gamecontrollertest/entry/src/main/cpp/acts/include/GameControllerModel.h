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

#ifndef APP_GAMECONTROLLER_TEST_GAME_CONTROLLER_MODEL_H
#define APP_GAMECONTROLLER_TEST_GAME_CONTROLLER_MODEL_H
#include <cstdint>
#include <string>

namespace OHOS {
namespace GameController {

/**
 * Device Type
 */
enum DeviceTypeEnum {
    UNKNOWN = 0,
    GAME_PAD = 1,
    HOVER_TOUCH_PAD = 2
};

struct BasicDeviceInfo {
    std::string uniq;
    std::string name;
    int32_t product;
    int32_t vendor;
    int32_t version;
    std::string phys;
    DeviceTypeEnum deviceType = UNKNOWN;
};

struct AllDeviceInfos {
    /**
     * List of all devices
     */
    std::vector<BasicDeviceInfo> allDeviceInfos;

    int32_t count;
};

/**
 * Game Device change event
 */
struct GameDeviceEvent {
    /**
     * Event type, which can be online or offline.
     */
    int32_t changeType;

    /**
     * Device Information
     */
    BasicDeviceInfo deviceInfo;
};

/**
 * Axis classification of game pad
 */
enum GamePadAxisSourceTypeEnum {
    /*
     * directional pad
     */
    DPAD = 0,

    /**
     * Left and right thumbstick
     */
    LEFT_THUMBSTICK = 1,
    RIGHT_THUMBSTICK = 2,

    /*
     * Left and right trigger
     */
    LEFT_TRIGGER_AXIS = 3,
    RIGHT_TRIGGER_AXIS = 4
};
/**
 * Axis Event
 */
struct AxisEvent {
    int32_t id;
    std::string uniq;
    GamePadAxisSourceTypeEnum axisSourceType;
    int64_t actionTime;
};

struct GamePadAxisEvent : AxisEvent {
    double xValue;
    double yValue;
    double zValue;
    double rzValue;
    double brakeValue;
    double gasValue;
    double hatxValue;
    double hatyValue;
};

/**
 * Key Information
 */
struct KeyInfo {
    int32_t keyCode;
    std::string keyCodeName;
    bool pressed;
    int64_t downTime;
};

enum GamePadButtonTypeEnum {
    LEFT_SHOULDER = 2307,
    RIGHT_SHOULDER = 2308,
    LEFT_TRIGGER = 2309,
    RIGHT_TRIGGER = 2310,
    LEFT_THUMBSTICK_BUTTON = 2314,
    RIGHT_THUMBSTICK_BUTTON = 2315,
    BUTTON_HOME = 2311,
    BUTTON_MENU = 2312,
    BUTTON_OPTIONS = 2313,
    BUTTON_A = 2301,
    BUTTON_B = 2302,
    BUTTON_C = 2303,
    BUTTON_X = 2304,
    BUTTON_Y = 2305,
    DPAD_UP_BUTTON = 2012,
    DPAD_DOWN_BUTTON = 2013,
    DPAD_LEFT_BUTTON = 2014,
    DPAD_RIGHT_BUTTON = 2015
};

struct ButtonEvent {
    int32_t id;
    std::string uniq;

    /*
     * down：0
     * up：1
     */
    int32_t keyAction;
    int32_t keyCode;
    std::string keyCodeName;
    std::vector<KeyInfo> keys;
    int64_t actionTime;
};

struct GamePadButtonEvent : ButtonEvent {
};
}
}

#endif //APP_GAMECONTROLLER_TEST_GAME_CONTROLLER_MODEL_H