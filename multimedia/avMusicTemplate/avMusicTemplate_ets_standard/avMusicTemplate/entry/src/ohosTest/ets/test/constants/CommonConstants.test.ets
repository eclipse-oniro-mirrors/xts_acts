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

import avMusicTemplate from '@ohos.multimedia.avMusicTemplate';


export class CommonConstants {
  /**
   * 包名
   */
  public static readonly BUNDLE_NAME = 'com.example.avmusictemplate';
  /**
   * 模板类型：smartCar
   */
  public static readonly TEMPLATE_TYPE = 'smartCar' as avMusicTemplate.AVMusicTemplateType;
  /**
   * 操作成功时errorCode的值
   */
  public static readonly SUCCESS_CODE = 0;
  /**
   * 操作直接默认延时间隔，单位：毫秒
   */
  public static readonly DEFAULT_TIME_INTERVAL = 200;
}