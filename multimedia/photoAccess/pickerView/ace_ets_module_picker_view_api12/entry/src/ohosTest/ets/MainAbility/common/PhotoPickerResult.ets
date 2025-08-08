/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

export class PhotoPickerResult {
  public checkBoxColor: string = '';
  public backgroundColor: string = '';
  public isRepeatSelectSupported: boolean = false;
  public photoBrowserBackgroundColorMode: number = 0;
  public maxSelectedReminderMode: number = 0;
  public orientation: number = 0;
  public themeColorMode: number = 0;
  public selectMode: number = 0;
  public maxSelectCount: number = 500;
  public maxPhotoSelectNumber: number = 500;
  public maxVideoSelectNumber: number = 500;
  public itemType: string = '';
  public checkboxTextColor: string = '';
}