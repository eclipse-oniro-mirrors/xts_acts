/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

export class AppInfoItem {
  public id: number
  public packageName: string
  public appName: string
  public appVersion: String
  public appIcon: string
  public abilityName: string

  constructor(packageName: string, appName: string, appVersion: String, appIcon: string, abilityName: string) {
    this.packageName = packageName
    this.appName = appName
    this.appVersion = appVersion
    this.appIcon = appIcon
    this.abilityName = abilityName
  }
}



