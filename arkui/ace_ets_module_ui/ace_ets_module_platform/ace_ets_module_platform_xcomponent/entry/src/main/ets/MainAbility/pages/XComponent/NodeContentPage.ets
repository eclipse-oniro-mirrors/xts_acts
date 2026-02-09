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
import nativeNode from 'libnativerender.so';
import { NodeContent } from '@kit.ArkUI';

@Entry
@Component
struct XComponentNodeContentPage {
  private nodeContent: NodeContent = new NodeContent();
  @State flag: boolean = true

  aboutToAppear():void{
    nativeNode.CreateNodeContentTestNativeRoot(this.nodeContent);
  }

  build() {
      Column() {
        Row() {
          if (this.flag) {
            ContentSlot(this.nodeContent)
          }
        }
        .width('90%')
        .height('70%')
        
        Button('Show/Hide').onClick(()=>{
          this.flag = !this.flag
        }).key('XComponentNodeContentPage_btn')
      }.height('100%')
  }
}
