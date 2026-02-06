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
import hilog from '@ohos.hilog';
import { AutoAdComponent } from '@ohos.advertising.AutoAdComponent';
import fs from '@ohos.file.fs';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  private context = getContext(this)

  async aboutToAppear() {
    console.info('test----------before copy:');
    await this.copyToSandbox("534d4152-542d-4353-b919-d3016a171fc5.sec", "534d4152-542d-4353-b919-d3016a171fc5.sec")

  }

  async copyToSandbox(srcFile: string, destFile: string) {
    try {
      const fileData = await this.context.resourceManager.getRawFileContent(srcFile);
      const destPath = this.context.filesDir + '/' + destFile;
      const fd = fs.openSync(destPath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      fs.writeSync(fd.fd, fileData.buffer);
      fs.closeSync(fd.fd);
      console.info('test-----------------------Copy sec success:');
      //return destPath; // 返回沙箱路径
    } catch (error) {
      console.error('test---Copy error:${error.message}');
    }
  }

  build() {
    Row() {
      Column() {

        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
