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
import { NodeContent } from '@kit.ArkUI';
import keyeventndk from 'libkeyeventndk.so';
@Entry
@Component
struct ArkUIKeySourceTypeTest {
  @State message: string = 'Hello World'
  private node = new NodeContent();

  aboutToAppear(): void {
    try {
      // 通过C-API创建节点，并添加到管理器nodeContent上
      keyeventndk.CreateNativeNode3(this.node)
    }catch (err) {
      console.error('aboutToAppear error:', err);
    }

  }

  build() {
    Column() {
      ContentSlot(this.node)
    }.size({ width: '100%', height: '100%' })
  }
}
