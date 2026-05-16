/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

export class Camera_Position {
  /**
   * Unspecified position.
   */
  static readonly CAMERA_POSITION_UNSPECIFIED = 0;
  /**
   * Back position.
   */
  static readonly CAMERA_POSITION_BACK = 1;
  /**
   * Front position.
   */
  static readonly CAMERA_POSITION_FRONT = 2
}

export class Camera_Type {
  /**
   * Default camera type.
   */
  static readonly CAMERA_TYPE_DEFAULT = 0;
  /**
   * Wide camera.
   */
  static readonly CAMERA_TYPE_WIDE_ANGLE = 1;
  /**
   * Ultra wide camera.
   */
  static readonly CAMERA_TYPE_ULTRA_WIDE = 2;
  /**
   * Telephoto camera.
   */
  static readonly CAMERA_TYPE_TELEPHOTO = 3;
  /**
   * True depth camera.
   */
  static readonly CAMERA_TYPE_TRUE_DEPTH = 4
}
;

//曝光模式枚举
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

export class Camera_FocusMode {
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
export class Camera_MediaType {
  static readonly IMAGE = 0;
  static readonly VIDEO = 1;
}