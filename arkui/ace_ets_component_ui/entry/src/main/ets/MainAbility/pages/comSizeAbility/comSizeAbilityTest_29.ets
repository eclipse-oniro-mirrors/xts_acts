/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import matrix4 from '@ohos.matrix4'
let matrix = matrix4.init([1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0])
@Entry
@Component
struct comSizeAbilityTest_29 {
  @State text1: string = "Select下拉框"
  @State index: number = 2
  build() {
    Scroll(){
      Column({ space: 20 }) {
        Column(){
          Line()
            .startPoint([0, 0])
            .endPoint([50, 100])
            .stroke(Color.Black)
            .backgroundColor('#f21122')
            .key("Line_Size")
            .size({ width: 220, height: 140 })
            .translate({ x: 1, y: 1, z: 1 })
            .scale({ x: 1, y: 1, z: 1, centerX: 1, centerY: 1 })
            .rotate({ x: 1, y: 1, z: 1, angle: 0, centerX: 1, centerY: 1 })
            .transform(matrix)
        }.key('Line_Father')
        Column(){
          Select([
            { value: '选项1' }
          ])
            .size({ width: 165, height: 120 })
            .translate({ x: 1, y: 1, z: 1 })
            .scale({ x: 1, y: 1, z: 1, centerX: 1, centerY: 1 })
            .rotate({ x: 1, y: 1, z: 1, angle: 0, centerX: 1, centerY: 1 })
            .transform(matrix)
            .key("Select_Size")
            .backgroundColor(0XBDDB69)
            .selected(this.index)
            .value(this.text1)
            .font({ size: 16, weight: 500 })
            .selectedOptionFont({ size: 16, weight: 400 })
            .optionFont({ size: 16, weight: 400 })
            .onSelect((index:number, text?: string | undefined)=>{
              console.info('Select:' + index)
              this.index = index;
              if(text){
                this.text1 = text;
              }
            })
        }.key('Select_Father')
        Column(){
          Image($r('app.media.icon'))
            .key("Image_Size")
            .backgroundColor('red')
            .size({ width: 90, height: 90 })
            .translate({ x: 1, y: 1, z: 1 })
            .scale({ x: 1, y: 1, z: 1, centerX: 1, centerY: 1 })
            .rotate({ x: 1, y: 1, z: 1, angle: 0, centerX: 1, centerY: 1 })
            .transform(matrix)
        }.key('Image_Father')
      }.width('100%')
    }.height('100%')
  }
}