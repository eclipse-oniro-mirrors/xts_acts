/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
 
import { unifiedDataChannel, uniformTypeDescriptor } from '@kit.ArkData';
import { promptAction } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct normalDragExample{
  @State numbers: number[] = [0, 1, 2, 3, 4 , 5, 6, 7, 8]
  @State uri: string = ""
  @State AblockArr: string[] = []
  @State BblockArr: string[] = []
  @State AVisible: Visibility = Visibility.Visible
  @State dragSuccess :Boolean = false
  @State text: string = ''
  @State text1: string = ''

  @State change: boolean = true

  build() {
    Scroll() {
      Column() {
        Image($r('app.media.apple'))
        .id('DragEvent')
          .width('45%')
          .height('45%')
          .backgroundColor(Color.Pink)
          .borderWidth(1)
          .draggable(true)
          .enabled(this.change)
          .onDrop((dragEvent?: DragEvent) => {
            let dragSource = (dragEvent as DragEvent).getDragSource();
            let isRemote = (dragEvent as DragEvent).isRemote();
              AppStorage.setOrCreate('dragSource1', dragSource)
             AppStorage.setOrCreate('isRemote1', isRemote)
          })
          .onDragStart((event)=>{
            let dragSource = (event as DragEvent).getDragSource();
            let isRemote = (event as DragEvent).isRemote();
              AppStorage.setOrCreate('dragSource2', dragSource)
             AppStorage.setOrCreate('isRemote2', isRemote)
          })
          .onDragEnter((event)=>{
            console.log('js222 onDragEnter1');
            let dragSource = (event as DragEvent).getDragSource();
            let isRemote = (event as DragEvent).isRemote();
              AppStorage.setOrCreate('dragSource3', dragSource)
             AppStorage.setOrCreate('isRemote3', isRemote)
          })
          .onDragMove((event)=>{
            let dragSource = (event as DragEvent).getDragSource();
            console.log('js222 dragSource1 is ',dragSource);
            let isRemote = (event as DragEvent).isRemote();
              AppStorage.setOrCreate('dragSource4', dragSource)
             AppStorage.setOrCreate('isRemote4', isRemote)
          })
          .onDragLeave((event)=>{
            let dragSource = (event as DragEvent).getDragSource();
            let isRemote = (event as DragEvent).isRemote();
              AppStorage.setOrCreate('dragSource5', dragSource)
             AppStorage.setOrCreate('isRemote5', isRemote)
          })
          .onDragEnd((event)=>{
            let dragSource = (event as DragEvent).getDragSource();
            let isRemote = (event as DragEvent).isRemote();
              AppStorage.setOrCreate('dragSource6', dragSource)
             AppStorage.setOrCreate('isRemote6', isRemote)
          })
      }
      .width("100%")
    }
  }
}