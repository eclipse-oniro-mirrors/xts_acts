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

import native from 'libnativerender.so'
import { NodeContent, typeNode } from '@kit.ArkUI';

@Entry
@Component
struct CrossLanguageOptionsSupportFiveMethods {
  @State message: string = 'Hello';
  nc: NodeContent = new NodeContent()
  node: FrameNode | null = null;
  node2: FrameNode | null = null;

  aboutToAppear(): void {
    this.node = typeNode.createNode(this.getUIContext(), 'Column')
    this.node!.setCrossLanguageOptions({treeOperating: false})
    this.node.commonAttribute.width(150).height(20).backgroundColor(Color.Red).id('col')
    this.nc.addFrameNode(this.node)
    this.node2 = typeNode.createNode(this.getUIContext(), 'Column')
    this.node2!.setCrossLanguageOptions({treeOperating: false})
    this.node2.commonAttribute.width(150).height(20).backgroundColor(Color.Green).id('col_child')
    this.node!.appendChild(this.node2)
  }

  aboutToDisappear(): void {
    this.nc.removeFrameNode(this.node!)
    this.node?.dispose()
    this.node = null;
  }

  build() {
    Column({space:2}) {
      Column({space:2}) {
        Row(){
          Button('AddChild')
            .onClick(()=>{
              native.CrossLanguageAddChildTest()
            })
            .id('CrossLanguageOptionsAddChild')
            .width(100)
            .height(15)
          Button('InsertChildAfter')
            .onClick(()=>{
              native.CrossLanguageInsertChildAfterTest()
            })
            .id('CrossLanguageOptionsInsertChildAfter')
            .width(100)
            .height(15)
        }
        Row(){
          Button('InsertChildBefore')
            .onClick(()=>{
              native.CrossLanguageInsertChildBeforeTest()
            })
            .id('CrossLanguageOptionsInsertChildBefore')
            .width(110)
            .height(15)
          Button('InsertChildAt')
            .onClick(()=>{
              native.CrossLanguageInsertChildAtTest()
            })
            .id('CrossLanguageOptionsInsertChildAt')
            .width(90)
            .height(15)
        }
        Row(){
          Button('RemoveChild')
            .onClick(()=>{
              native.CrossLanguageRemoveChildTest()
            })
            .id('CrossLanguageOptionsRemoveChild')
            .width(100)
            .height(15)
          Button('SetTrue')
            .onClick(()=>{
              this.node!.setCrossLanguageOptions({treeOperating: true})
              this.node2!.setCrossLanguageOptions({treeOperating: true})
            })
            .id('CrossLanguageOptionsSetTrue')
            .width(100)
            .height(15)
        }
        Row(){
          Button('SetNull')
            .onClick(()=>{
              this.node!.setCrossLanguageOptions({treeOperating: null})
              this.node2!.setCrossLanguageOptions({treeOperating: null})
            })
            .id('CrossLanguageOptionsSetNull')
            .width(100)
            .height(15)
          Button('SetUndefined')
            .onClick(()=>{
              this.node!.setCrossLanguageOptions({treeOperating: undefined})
              this.node2!.setCrossLanguageOptions({treeOperating: undefined})
            })
            .id('CrossLanguageOptionsSetUndefined')
            .width(100)
            .height(15)
        }
        Column() {
          ContentSlot(this.nc)
        }
      }
    }
    .width('100%')
    .height('100%')
  }
}
