/*
* Copyright (c) 2025 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { NodeContent } from '@kit.ArkUI';
import nativeNode from "libnativerender.so"

@Entry
@Component
struct XComponentTextureSampleIndex2 {
  // 初始化NodeContent对象。
  private rootSlot = new NodeContent();

  build() {
    Scroll() {
      Flex({ direction: FlexDirection.Row, wrap: FlexWrap.Wrap }) {
        Column({ space: 10 }){
          // 将NodeContent和ContentSlot占位组件绑定。
          ContentSlot(this.rootSlot)
        }
        .onAppear(() => {
          nativeNode.XComponentTextureCreateNativeNode(this.rootSlot, this.getUIContext())
        })
        .onDisAppear(() => {
          nativeNode.XComponentTextureDisposeNativeNode(this.rootSlot)
        })
        .width('100%')

      }
      .width('100%')
    }
    .width('100%')
  }
}