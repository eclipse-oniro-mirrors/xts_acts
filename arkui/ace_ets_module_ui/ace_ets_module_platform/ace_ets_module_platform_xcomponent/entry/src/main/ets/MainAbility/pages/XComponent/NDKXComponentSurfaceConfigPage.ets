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
import native from 'libnativerender.so';
import { FrameNode, NodeController, typeNode, UIContext } from '@kit.ArkUI';

@Entry
@Component
struct NDKXComponentSurfaceConfigPage {
  @State isShow: boolean = true;
  private xcNode: FrameNode | null = null;

  build() {
      Column() {
        XComponent({
          type: XComponentType.SURFACE
        })
          .height('50%')
          .width('90%')
          .backgroundColor(Color.Red)
          .key('NDKXComponentSurfaceConfigPage_XComponent')
          .onAttach(() => {
            this.xcNode = this.getUIContext().getAttachedFrameNodeById('NDKXComponentSurfaceConfigPage_XComponent')
            console.log('onAttach' + JSON.stringify(this.xcNode))
            native.bindNode('NDKXComponentSurfaceConfigPage_XComponent', this.xcNode)
          })
          .onDetach(()=>{
            console.log('onDetach' + JSON.stringify(this.xcNode))
            native.unbindNode('NDKXComponentSurfaceConfigPage_XComponent')
          })
      }.height('100%')
  }
}