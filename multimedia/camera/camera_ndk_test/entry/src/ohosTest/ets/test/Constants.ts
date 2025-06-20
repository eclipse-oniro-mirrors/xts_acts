/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import common from '@ohos.app.ability.common';

export class GlobalThis {
  private constructor() {}
  private static instance: GlobalThis;
  private _uiContexts = new Map<string, common.UIAbilityContext>();
  private value: string = '';

  public static getInstance(): GlobalThis{
    if (!GlobalThis.instance) {
      GlobalThis.instance = new GlobalThis();
    }
    return GlobalThis.instance;
  }
  getContext(key: string): common.UIAbilityContext | undefined {
    return this._uiContexts.get(key);
  }
  setContext(key: string, value: common.UIAbilityContext): void {
    this._uiContexts.set(key, value);
  }
  setValue(value: string) {
    this.value = value;
  }
  getValue(): string {
    return this.value;
  }
}

export class Camera_ErrorCode {
  static readonly CAMERA_OK = 0;
  static readonly CAMERA_INVALID_ARGUMENT = 7400101;
  static readonly CAMERA_OPERATION_NOT_ALLOWED = 7400102;
  static readonly CAMERA_SESSION_NOT_CONFIG = 7400103;
  static readonly CAMERA_SESSION_NOT_RUNNING = 7400104;
  static readonly CAMERA_SESSION_CONFIG_LOCKED = 7400105;
  static readonly CAMERA_DEVICE_SETTING_LOCKED = 7400106;
  static readonly CAMERA_CONFLICT_CAMERA = 7400107;
  static readonly CAMERA_DEVICE_DISABLED = 7400108;
  static readonly CAMERA_DEVICE_PREEMPTED = 7400109;
  static readonly CAMERA_SERVICE_FATAL_ERROR = 7400201;
}

export class Camera_ExposureMode {
  static readonly EXPOSURE_MODE_LOCKED = 0;
  static readonly EXPOSURE_MODE_AUTO = 1;
  static readonly EXPOSURE_MODE_CONTINUOUS_AUTO = 2;
}

export class Camera_FlashMode {
  static readonly FLASH_MODE_CLOSE = 0;
  static readonly FLASH_MODE_OPEN = 1;
  static readonly FLASH_MODE_AUTO = 2;
  static readonly FLASH_MODE_ALWAYS_OPEN = 3;
}

export class  Camera_FocusMode {
  static readonly FOCUS_MODE_MANUAL = 0;
  static readonly FOCUS_MODE_CONTINUOUS_AUTO = 1;
  static readonly FOCUS_MODE_AUTO = 2;
  static readonly FOCUS_MODE_LOCKED = 3;
}

export class Camera_VideoStabilizationMode {
  static readonly STABILIZATION_MODE_OFF = 0;
  static readonly STABILIZATION_MODE_LOW = 1;
  static readonly STABILIZATION_MODE_MIDDLE = 2;
  static readonly STABILIZATION_MODE_HIGH = 3;
  static readonly STABILIZATION_MODE_AUTO = 4;
}

export class Camera_PreconfigType {
  static readonly EXCEPTION_ENUMERATION_VALUE = -1;
  static readonly PRECONFIG_720P = 0;
  static readonly PRECONFIG_1080P = 1;
  static readonly PRECONFIG_4K = 2;
  static readonly PRECONFIG_HIGH_QUALITY = 3;
}

export class Camera_PreconfigRatio {
  static readonly EXCEPTION_ENUMERATION_VALUE = -1;
  static readonly PRECONFIG_RATIO_1 = 0;
  static readonly PRECONFIG_RATIO_4 = 1;
  static readonly PRECONFIG_RATIO_16 = 2;
}

export class Camera_MediaType {
  static readonly IMAGE = 0;
  static readonly VIDEO = 1;
}

export class Camera_SceneMode {
  static readonly NORMAL_PHOTO = 0;
  static readonly NORMAL_VIDEO = 1;
  static readonly SECURE_PHOTO = 2;
}

export class Parameter_Setting {
  static readonly ALL_PARAMETER_OK = 0;
  static readonly FIRST_PARAMETER_ERROR = 1;
  static readonly SECOND_PARAMETER_ERROR = 2;
  static readonly THIRD_PARAMETER_ERROR = 3;
  static readonly FOURTH_PARAMETER_ERROR = 4;
  static readonly SET_CAMERA_FRONT_FOR_SECURE_PHOTO = 5;
}

export class Torch_Mode {
  static readonly OFF = 0;
  static readonly ON = 1;
  static readonly AUTO = 2;
}

export class Camera_QualityPrioritization {
  static readonly HIGH_QUALITY = 0;
  static readonly POWER_BALANCE = 1;
}