/*
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
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';

export function log(info: string) {
  console.error("[ServiceExtApp]:: ", info);
}

function readUri(uri: string | undefined) {
  try {
    log(`uri = ${uri}`);
    let file = fs.openSync(uri, fs.OpenMode.READ_ONLY);
    log(`open file successfully!`);
    let buf = new ArrayBuffer(1024);
    let readLen = fs.readSync(file.fd, buf, { offset: 0 });
    log("read ok!" + readLen);
    fs.closeSync(file);
    return "read ok!";
  } catch (e) {
    log("read failed:" + JSON.stringify(e));
    return "read failed: " + JSON.stringify(e);
  }
}

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  uri: string | undefined = "";

  aboutToAppear() {
    this.uri = AppStorage.get<string>("uri");
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
        Button("ReadUri")
          .height("7%")
          .width("85%")
          .onClick(() => {
            let res = readUri(this.uri);
            this.message = res;
          })

        Blank()
          .height("7%")

        Button("返回")
          .height("7%")
          .width("85%")
          .onClick(() => {
            let context = getContext() as common.UIAbilityContext;
            context.terminateSelf();
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}