/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { webview } from '@kit.ArkWeb'
import { hilog } from '@kit.PerformanceAnalysisKit';
import test_ndk from 'libentry.so'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  aboutToAppear(): void {
    this.get_ActiveWebEngineVersion();
  }

  private get_ActiveWebEngineVersion(): void {
    let tmp_result = test_ndk.test_ndk_getActiveWebEngineVersion();
    if (tmp_result == webview.ArkWebEngineVersion.SYSTEM_DEFAULT){
      this.message = 'ndk测试:当前是 SYSTEM_DEFAULT'
    } else if (tmp_result == webview.ArkWebEngineVersion.M114) {
      this.message = "ndk测试:当前是 M114";
    } else if (tmp_result == webview.ArkWebEngineVersion.M132) {
      this.message = "ndk测试:当前是 M132";
    } else {
      this.message = "ndk测试:error";
    }
  }

  build() {
    RelativeContainer() {
      Column( { space: 20 } ) {
        Text(this.message)
          .fontWeight(FontWeight.Bold)
        Button('get_ActiveWebEngineVersion')
          .onClick(() => {
            this.get_ActiveWebEngineVersion();
          })
        Row( { space: 20 } ) {
          Button('set_SYSTEM_DEFAULT')
            .onClick(() => {
              test_ndk.test_ndk_setActiveWebEngineVersion(webview.ArkWebEngineVersion.SYSTEM_DEFAULT);
              let tmp_result = test_ndk.test_ndk_getActiveWebEngineVersion();
            })
        }
        Row( { space: 20 } ) {
          Button('set_M114')
            .onClick(() => {
              test_ndk.test_ndk_setActiveWebEngineVersion(webview.ArkWebEngineVersion.M114);
            })
          Button('set_M132')
            .onClick(() => {
              test_ndk.test_ndk_setActiveWebEngineVersion(webview.ArkWebEngineVersion.M132);
            })
        }
        Row( { space: 20 } ) {
          Button('set_999')
            .onClick(() => {
              test_ndk.test_ndk_setActiveWebEngineVersion(999);
            })
        }
      }
      .height('100%')
      .width('100%')
      .alignItems(HorizontalAlign.Center)
    }
    .height('100%')
    .width('100%')
  }
}
