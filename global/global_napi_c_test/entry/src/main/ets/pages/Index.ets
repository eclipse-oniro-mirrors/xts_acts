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

import hilog from '@ohos.hilog';

import { util } from '@kit.ArkTS';
import { resourceManager } from '@kit.LocalizationKit';
import testNapi from 'libentry.so'; // 导入so

@Entry
@Component
struct GetListPage {
  @State message: string = 'Hello World';
  private resMgr = this.getUIContext().getHostContext()?.resourceManager; // 获取本应用包的资源对象
  @State rawfileListMsg: string = 'FileList = ';
  @State retMsg: string = 'isRawDir = ';
  @State rawfileContentMsg: string = 'RawFileContent = ';
  @State rawfileDescriptorMsg: string = 'RawFileDescriptor.length = ';

  aboutToAppear(): void {
    // 传入资源管理对象，以及访问的rawfile文件夹名称
    console.info(`====>GetMediaBase640100 rawfileId====${$rawfile('rawfileTest.txt').id}`);
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .id('hello_world')
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
        Text(this.rawfileListMsg).id('get_file_list').fontSize(30);
      }
      .width('100%')
    }
    .height('100%')
  }
}
