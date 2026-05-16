/**
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

@Entry
@Component
struct SideBarContainerAttributeNullUndefined {
  @State arr: number[] = [1, 2, 3];
  @State current: number = 1;
  @State sideBarWidth: number = 100;
  @State minSideBarWidth: number = 200;
  @State maxSideBarWidth: number = 300;

  build() {
    Column({space: 5}) {
      SideBarContainer(SideBarContainerType.Embed) {
        Column() {
          ForEach(this.arr, (item: number) => {
            Column({ space: 5 }) {
              Text('Index0' + item)
                .fontSize(25)
                .fontColor(this.current === item ? '#0A59F7' : '#999')
                .fontFamily('source-sans-pro,cursive,sans-serif')
            }
            .onClick(() => {
              this.current = item
            })
          }, (item: string) => item)
        }.width('100%').key('SideBarContainer_Attribute_SideBar_01')
        .justifyContent(FlexAlign.SpaceEvenly)
        .backgroundColor('#19000000')

        Column() {
          Text('SideBarContainer content text1').fontSize(25)
          Text('SideBarContainer content text2').fontSize(25)
        }
        .margin({ top: 50, left: 20, right: 30 })

      }
      .showSideBar(false)
      .controlButton(null)
      .controlButton({icons: {shown: '', hidden: '', switching: ''}})
      .sideBarWidth(null)
      .minSideBarWidth(null)
      .maxSideBarWidth(null)
      .minContentWidth(null)
      .divider(null)
      .key('sidebar1')
      .height('30%')
      SideBarContainer(SideBarContainerType.Embed) {
        Column() {
          ForEach(this.arr, (item: number) => {
            Column({ space: 5 }) {
              Text('Index0' + item)
                .fontSize(25)
                .fontColor(this.current === item ? '#0A59F7' : '#999')
                .fontFamily('source-sans-pro,cursive,sans-serif')
            }
            .onClick(() => {
              this.current = item
            })
          }, (item: string) => item)
        }.width('100%').key('SideBarContainer_Attribute_SideBar_01')
        .justifyContent(FlexAlign.SpaceEvenly)
        .backgroundColor('#19000000')

        Column() {
          Text('SideBarContainer content text1').fontSize(25)
          Text('SideBarContainer content text2').fontSize(25)
        }
        .margin({ top: 50, left: 20, right: 30 })

      }
      .showSideBar(true)
      .controlButton(undefined)
      .controlButton({icons: {shown: '', hidden: '', switching: ''}})
      .sideBarWidth(undefined)
      .minSideBarWidth(undefined)
      .maxSideBarWidth(undefined)
      .minContentWidth(undefined)
      .divider(undefined)
      .key('sidebar2')
      .height('30%')
      SideBarContainer(SideBarContainerType.Embed) {
        Column() {
          ForEach(this.arr, (item: number) => {
            Column({ space: 5 }) {
              Text('Index0' + item)
                .fontSize(25)
                .fontColor(this.current === item ? '#0A59F7' : '#999')
                .fontFamily('source-sans-pro,cursive,sans-serif')
            }
            .onClick(() => {
              this.current = item
            })
          }, (item: string) => item)
        }.width('100%').key('SideBarContainer_Attribute_SideBar_01')
        .justifyContent(FlexAlign.SpaceEvenly)
        .backgroundColor('#19000000')

        Column() {
          Text('SideBarContainer content text1').fontSize(25)
          Text('SideBarContainer content text2').fontSize(25)
        }
        .margin({ top: 50, left: 20, right: 30 })

      }
      .key('sidebar3')
      .height('30%')
    }
  }
}
