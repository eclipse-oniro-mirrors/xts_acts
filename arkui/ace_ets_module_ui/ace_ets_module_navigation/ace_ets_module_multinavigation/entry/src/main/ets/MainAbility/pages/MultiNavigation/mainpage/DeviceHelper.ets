/**
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

import hilog from '@ohos.hilog';
import deviceInfo from '@ohos.deviceInfo';
import display from '@ohos.display';

const TAG = 'DeviceHelper';

/**
 * device info util
 *
 * @since 2024-5-11
 */
export class DeviceHelper {
  static readonly TYPE_DEFAULT = 'default';
  static readonly TYPE_PHONE = 'phone';
  static readonly TYPE_TABLET = 'tablet';
  static readonly DEVICE_TYPE = deviceInfo.deviceType;

  /**
   * whether the device type is phone
   *
   * @returns true if is phone
   */
  static isPhone(): boolean {
    return (DeviceHelper.DEVICE_TYPE === DeviceHelper.TYPE_PHONE || DeviceHelper.DEVICE_TYPE === DeviceHelper.TYPE_DEFAULT);
  }

  /**
   * whether the device type is tablet
   *
   * @returns true if is tablet
   */
  public static isTablet(): boolean {
    return DeviceHelper.DEVICE_TYPE === DeviceHelper.TYPE_TABLET;
  }

  /**
   * Check if is foldable
   *
   * @returns true if is foldable
   */
  static isFold(): boolean {
    let isFold: boolean = false;
    try {
      isFold = display.isFoldable();
    } catch (e) {
      hilog.error(0x0000, TAG, 'isFold -> isFoldable try error:', e);
    }
    return isFold;
  }

  /**
   * Check if is expanded
   *
   * @returns true if is expanded
   */
  static isExpanded(): boolean {
    let isExpanded: boolean = false;
    try {
      isExpanded = display.getFoldStatus() === display.FoldStatus.FOLD_STATUS_EXPANDED;
    } catch (e) {
      hilog.error(0x0000, TAG, 'isExpanded -> try error:', e);
    }
    return isExpanded;
  }

  /**
   * Check if is column
   *
   * @returns true if is column
   */
  static isColumn(): boolean {
    let isColumn: boolean = false;
    try {
      isColumn = display.isFoldable() && (display.getFoldStatus() === display.FoldStatus.FOLD_STATUS_EXPANDED ||
        display.getFoldStatus() === display.FoldStatus.FOLD_STATUS_HALF_FOLDED);
    } catch (e) {
      hilog.error(0x0000, TAG, 'isColumn -> try error:', e);
    }
    return isColumn;
  }

  /**
   * Check if is straight product
   *
   * @returns true if is straight product
   */
  public static isStraightProduct(): boolean {
    return DeviceHelper.isPhone() && !DeviceHelper.isFold();
  }
}