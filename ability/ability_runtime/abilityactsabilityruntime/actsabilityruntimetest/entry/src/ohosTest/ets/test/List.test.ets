/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import UIRestartApp from './UIRestartApp.test'
import ConfigurationFontSettings from './ConfigurationFontSettings.test'
import StartNativeChildProcess from './StartNativeChildProcess.test'
import AbilityYStartAbilityOpenLink from './AbilityStartAbilityOpenLink.test'
import ConfigurationApplicationContextSetColorMode from './ConfigurationApplicationContextSetColorMode.test'
import ConfigurationApplicationContextSetLanguage from './ConfigurationApplicationContextSetLanguage.test'
import AmsJSChildProcess from './AmsJsChildProcess.test'
import CreateDifferentAreaContext from './CreateDifferentAreaContext.test'

export default function testsuite() {
  UIRestartApp()
  ConfigurationFontSettings()
  StartNativeChildProcess()
  AbilityYStartAbilityOpenLink()
  ConfigurationApplicationContextSetColorMode()
  ConfigurationApplicationContextSetLanguage()
  AmsJSChildProcess()
  CreateDifferentAreaContext()
}


