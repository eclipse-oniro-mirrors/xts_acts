/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
@Entry
@Component
struct SidebarType {
  @State strokeWidthStr: string = '10px';
  @State dividerColorStr: string = '#000000';
  @State startMarginStr: string = '5px';
  @State endMarginStr: string = '5px';
  @State nullFlag: boolean = false;
  @State dividerColor: Color = Color.Red;
  normalIcon: Resource = $r('app.media.icon');
  selectedIcon: Resource = $r('app.media.icon');
  @State arr: number[] = [1, 2, 3];
  @State current: number = 1;

  build() {
    Column() {
      SideBarContainer(SideBarContainerType.AUTO) {
        Column() {
          ForEach(this.arr, (item: number, index) => {
            Column({ space: 5 }) {
              Image(this.current === item ? this.selectedIcon : this.normalIcon).width(64).height(64)
              Text('Index0' + item)
                .fontSize(25)
                .fontColor(this.current === item ? '#0A59F7' : '#999')
                .fontFamily('source-sans-pro,cursive,sans-serif')
            }
            .onClick(() => {
              this.current = item
            })
          }, (item: string) => item)
        }.width('100%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .backgroundColor('#19000000')

        Column() {
          Text('SideBarContainer content 000000').fontSize(25)
          Text('SideBarContainer content 0000000').fontSize(25)
        }
        .margin({ top: 50, left: 20, right: 30 })
      }
      .key('ArkUX_SideBarContainer_1000')
      .sideBarWidth(150)
      .minContentWidth(300)
      .minSideBarWidth(100)
      .controlButton({
        left: 16,
        top: 48,
        width: 32,
        height: 32,
        icons: {
          shown: $r('app.media.icon'),
          hidden: $r('app.media.icon'),
          switching: $r('app.media.icon')
        }
      })
      .divider(this.nullFlag ? null : {
        strokeWidth: this.strokeWidthStr,
        color: this.dividerColorStr,
        startMargin: this.startMarginStr,
        endMargin: this.endMarginStr
      })


      SideBarContainer(SideBarContainerType.AUTO) {
        Column() {
          ForEach(this.arr, (item: number, index) => {
            Column({ space: 5 }) {
              Image(this.current === item ? this.selectedIcon : this.normalIcon).width(64).height(64)
              Text('Index0' + item)
                .fontSize(25)
                .fontColor(this.current === item ? '#0A59F7' : '#999')
                .fontFamily('source-sans-pro,cursive,sans-serif')
            }
            .onClick(() => {
              this.current = item
            })
          }, (item: string) => item)
        }.width('100%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .backgroundColor('#19000000')

        Column() {
          Text('SideBarContainer content 111111').fontSize(25)
          Text('SideBarContainer content 1111111').fontSize(25)
        }
        .margin({ top: 50, left: 20, right: 30 })
      }
      .key('ArkUX_SideBarContainer_1100')
      .sideBarWidth(150)
      .minContentWidth(30000)
      .minSideBarWidth(10000)
      .controlButton({
        left: 16,
        top: 48,
        width: 32,
        height: 32,
        icons: {
          shown: $r('app.media.icon'),
          hidden: $r('app.media.icon'),
          switching: $r('app.media.icon')
        }
      })
      .divider({
        strokeWidth: this.strokeWidthStr,
        color: this.dividerColorStr,
        startMargin: this.startMarginStr,
        endMargin: this.endMarginStr
      })

      SideBarContainer(SideBarContainerType.Embed) {
        Column() {
          ForEach(this.arr, (item: number, index) => {
            Column({ space: 5 }) {
              Image(this.current === item ? this.selectedIcon : this.normalIcon).width(64).height(64)
              Text('Index0' + item)
                .fontSize(25)
                .fontColor(this.current === item ? '#0A59F7' : '#999')
                .fontFamily('source-sans-pro,cursive,sans-serif')
            }
            .onClick(() => {
              this.current = item
            })
          }, (item: string) => item)
        }.width('100%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .backgroundColor('#19000000')

        Column() {
          Text('SideBarContainer content 222222').fontSize(25)
          Text('SideBarContainer content 2222222').fontSize(25)
        }
        .margin({ top: 50, left: 20, right: 30 })
      }
      .key('ArkUX_SideBarContainer_1200')
      .sideBarWidth(150)
      .minContentWidth(10)
      .minSideBarWidth(10)
      .controlButton({
        left: 16,
        top: 48,
        width: 32,
        height: 32,
        icons: {
          shown: $r('app.media.icon'),
          hidden: $r('app.media.icon'),
          switching: $r('app.media.icon')
        }
      })
      .divider({
        strokeWidth: this.strokeWidthStr,
        color: this.dividerColorStr,
        startMargin: this.startMarginStr,
        endMargin: this.endMarginStr
      })


      SideBarContainer(SideBarContainerType.Overlay) {
        Column() {
          ForEach(this.arr, (item: number, index) => {
            Column({ space: 5 }) {
              Image(this.current === item ? this.selectedIcon : this.normalIcon).width(64).height(64)
              Text('Index2' + item)
                .fontSize(25)
                .fontColor(this.current === item ? '#0A59F7' : '#999')
                .fontFamily('source-sans-pro,cursive,sans-serif')
            }
            .onClick(() => {
              this.current = item
            })
          }, (item: string) => item)
        }.width('100%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .backgroundColor('#19000000')

        Column() {
          Text('SideBarContainer content 333333').fontSize(25)
          Text('SideBarContainer content 3333333').fontSize(25)
        }
        .margin({ top: 50, left: 20, right: 30 })
      }
      .key('ArkUX_SideBarContainer_1300')
      .sideBarWidth(150)
      .minContentWidth(200)
      .minSideBarWidth(400)
      .controlButton({
        left: 16,
        top: 48,
        width: 32,
        height: 32,
        icons: {
          shown: $r('app.media.icon'),
          hidden: $r('app.media.icon'),
          switching: $r('app.media.icon')
        }
      })
      .divider({
        strokeWidth: this.strokeWidthStr,
        color: this.dividerColorStr,
        startMargin: this.startMarginStr,
        endMargin: this.endMarginStr
      })


      SideBarContainer() {
        Column() {
          ForEach(this.arr, (item: number, index) => {
            Column({ space: 5 }) {
              Image(this.current === item ? this.selectedIcon : this.normalIcon).width(64).height(64)
              Text('Index0' + item)
                .fontSize(25)
                .fontColor(this.current === item ? '#0A59F7' : '#999')
                .fontFamily('source-sans-pro,cursive,sans-serif')
            }
            .onClick(() => {
              this.current = item
            })
          }, (item: string) => item)
        }.width('100%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .backgroundColor('#19000000')

        Column() {
          Text('SideBarContainer content 444444').fontSize(25)
          Text('SideBarContainer content 4444444').fontSize(25)
        }
        .margin({ top: 50, left: 20, right: 30 })
      }
      .key('ArkUX_SideBarContainer_1400')
      .sideBarWidth(150)
      .minContentWidth(null)
      .minSideBarWidth(null)
      .controlButton({
        left: 16,
        top: 48,
        width: 32,
        height: 32,
        icons: {
          shown: $r('app.media.icon'),
          hidden: $r('app.media.icon'),
          switching: $r('app.media.icon')
        }
      })
    }
  }
}