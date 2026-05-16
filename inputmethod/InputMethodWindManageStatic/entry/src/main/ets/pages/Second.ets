'use static'
/**
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
import { Entry, Text, TextAttribute, Column, Component, Button, ButtonAttribute, ClickEvent, TextArea } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins

@Entry
@Component
struct Second {
  private content: string = 'Second Page';
    
  build() {
  }
}