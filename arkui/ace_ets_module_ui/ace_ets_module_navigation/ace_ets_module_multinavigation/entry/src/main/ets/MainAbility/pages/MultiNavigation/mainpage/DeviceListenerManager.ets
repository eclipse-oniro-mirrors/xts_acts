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

import mediaquery from '@ohos.mediaquery';
import hilog from '@ohos.hilog';

export class DeviceListenerManager {
  private static instance: DeviceListenerManager | undefined;
  private portraitListener = mediaquery.matchMediaSync('(orientation: portrait)');
  private drawableWidthLargeListener = mediaquery.matchMediaSync('(width >= 600vp)');
  private isPortrait: boolean | undefined = undefined;
  private onOrientationChange: Function | undefined = undefined;
  private isLarge: boolean | undefined = undefined;
  private onDrawableWidthChange: Function | undefined = undefined;

  public static getInstance(): DeviceListenerManager {
    if (DeviceListenerManager.instance === undefined) {
      DeviceListenerManager.instance = new DeviceListenerManager();
    }
    return DeviceListenerManager.instance;
  }

  private onPortraitChange(result: mediaquery.MediaQueryResult) {
    let isChanged: boolean = false;
    if (DeviceListenerManager.getInstance().isPortrait === undefined) {
      DeviceListenerManager.getInstance().isPortrait = result.matches;
      isChanged = true;
    } else {
      if (result.matches) {
        if (!DeviceListenerManager.getInstance().isPortrait) {
          DeviceListenerManager.getInstance().isPortrait = true;
          isChanged = true;
          hilog.debug(0x0000, 'MultiNavigation', 'display portrait');
        }
      } else {
        if (DeviceListenerManager.getInstance().isPortrait) {
          DeviceListenerManager.getInstance().isPortrait = false;
          isChanged = true;
          hilog.debug(0x0000, 'MultiNavigation', 'display landscape');
        }
      }
    }
    if (isChanged) {
      DeviceListenerManager.getInstance().notifyOrientationChange();
    }
  }

  private notifyOrientationChange() {
    this.onOrientationChange && this.onOrientationChange(this.isPortrait);
  }

  private onDrawableWidthLargeChange(result: mediaquery.MediaQueryResult) {
    let isChanged: boolean = false;
    if (DeviceListenerManager.getInstance().isLarge === undefined) {
      DeviceListenerManager.getInstance().isLarge = result.matches;
      isChanged = true;
    } else {
      if (result.matches) {
        if (!DeviceListenerManager.getInstance().isLarge) {
          DeviceListenerManager.getInstance().isLarge = true;
          isChanged = true;
          hilog.debug(0x0000, 'MultiNavigation', 'display isLarge');
        }
      } else {
        if (DeviceListenerManager.getInstance().isLarge) {
          DeviceListenerManager.getInstance().isLarge = false;
          isChanged = true;
          hilog.debug(0x0000, 'MultiNavigation', 'display not large');
        }
      }
    }

    if (isChanged) {
      DeviceListenerManager.getInstance().notifyWidthChange();
    }
  }

  private notifyWidthChange() {
    this.onDrawableWidthChange && this.onDrawableWidthChange(this.isLarge);
  }

  public registerOrientationLister(func: Function): void {
    this.onOrientationChange = func;
    this.onOrientationChange && this.isPortrait && this.onOrientationChange(this.isPortrait);
  }

  public unregisterOrientationLister(): void {
    this.onOrientationChange = undefined;
  }

  public registerDrawableWidthLister(func: Function): void {
    this.onDrawableWidthChange = func;
    this.onDrawableWidthChange && this.isLarge && this.onDrawableWidthChange(this.isLarge);
  }

  public unregisterDrawableWidthLister(): void {
    this.onDrawableWidthChange = undefined;
  }

  public initListener(): void {
    this.portraitListener.on('change', this.onPortraitChange);
    this.drawableWidthLargeListener.on('change', this.onDrawableWidthLargeChange);
  }

  public finalizeListener() {
    this.portraitListener.off('change', this.onPortraitChange);
    this.drawableWidthLargeListener.off('change', this.onDrawableWidthLargeChange);
  }
}