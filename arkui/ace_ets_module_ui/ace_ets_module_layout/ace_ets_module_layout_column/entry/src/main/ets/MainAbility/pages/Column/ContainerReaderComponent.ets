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

import { BreakpointOptions, ContainerReader, ContainerReaderAttribute } from '@kit.ArkUI';

@Entry
@Component
struct ContainerReaderComponent {
  @State containerSize: Size|null|undefined = { width: 10, height: 10 };
  @State widthBp: WidthBreakpoint|undefined|null = WidthBreakpoint.WIDTH_XS;
  @State heightBp: HeightBreakpoint|undefined|null = HeightBreakpoint.HEIGHT_SM;
  @State breakpointOptions:BreakpointOptions|null|undefined = { width: [100, 200, 400, 500], height: [0.8, 1.2] }
  @State breakpointOptions1:BreakpointOptions|null|undefined = { width: undefined, height: undefined }
  build() {
    Column({space:3}) {
      Row(){
        Button('change1')
          .id('ContainerReaderComponentChange1')
          .onClick(()=>{
            this.breakpointOptions = this.breakpointOptions1
            this.widthBp = WidthBreakpoint.WIDTH_SM
            this.heightBp = HeightBreakpoint.HEIGHT_MD
          })
          .width(68)
          .height(15)
        Button('change2')
          .id('ContainerReaderComponentChange2')
          .onClick(()=>{
            this.widthBp = WidthBreakpoint.WIDTH_MD
            this.heightBp = HeightBreakpoint.HEIGHT_LG
          })
          .width(68)
          .height(15)
        Button('change3')
          .id('ContainerReaderComponentChange3')
          .onClick(()=>{
            this.widthBp = WidthBreakpoint.WIDTH_LG
          })
          .width(68)
          .height(15)
      }
      Row(){
        Button('change4')
          .id('ContainerReaderComponentChange4')
          .onClick(()=>{
            this.widthBp = WidthBreakpoint.WIDTH_XL
          })
          .width(68)
          .height(15)
        Button('changeNull')
          .id('ContainerReaderComponentChangeNull')
          .onClick(()=>{
            this.containerSize = null
            this.widthBp = null
            this.heightBp = null
            this.breakpointOptions = null
          })
          .width(100)
          .height(15)
      }
      Button('changeUndefined')
        .id('ContainerReaderComponentChangeUndefined')
        .onClick(()=>{
          this.containerSize = undefined
          this.widthBp = undefined
          this.heightBp = undefined
          this.breakpointOptions = undefined
        })
        .width(120)
        .height(15)
      ContainerReader({
        size: this.containerSize,
        widthBreakpoint: this.widthBp,
        heightBreakpoint:this.heightBp
      }) {
        if (this.widthBp === WidthBreakpoint.WIDTH_XS || this.widthBp === WidthBreakpoint.WIDTH_SM) {
          Column({space: 2}) {
            Text('竖向布局').height(20)
            Text(`Column`).height(20)
          }
          .width(150)
          .height(100)
          .backgroundColor('#D5D5D5')
          .justifyContent(FlexAlign.Center)
        } else {
          Row({space: 2}) {
            Text('横向布局').height(20)
            Text(`Row`).height(20)
          }
          .width(150)
          .height(100)
          .backgroundColor('#2787D9')
          .justifyContent(FlexAlign.Center)
        }
      }
      .id('ContainerReaderComponent')
      .width(200)
      .height(130)
      .breakpointConfig(this.breakpointOptions)
      .backgroundColor('#F0FAFF')
    }
    .height('100%')
    .width('100%')
  }
}