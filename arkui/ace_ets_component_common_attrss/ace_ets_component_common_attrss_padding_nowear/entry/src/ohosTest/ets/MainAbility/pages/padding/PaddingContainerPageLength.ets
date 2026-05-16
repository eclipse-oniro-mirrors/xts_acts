/*
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
import attrsManager from '../../common/AttrsManager';
import router from '@ohos.router'


@Entry
@Component
struct PaddingPage_Length {
  //Use for Grid.
  public valueArr: number[] = [5, 10, 10, 7, 9, 10, 10, 10, 10]
  @State _padding: number | string = 0;
  @State targetView: string = router.getParams() ? (router.getParams() as ESObject)['view']['targetView'] : ''
  @State componentKey: string = router.getParams() ? (router.getParams() as ESObject)['view']['componentKey'] : ''
  @State parentBackGroundColor: string = router.getParams() ? (router.getParams() as ESObject)['view']['parentBackGroundColor'] : ''
  @State parentComponentKey: string = router.getParams() ? (router.getParams() as ESObject)['view']['parentComponentKey'] : ''
  @State parentWidth: number = router.getParams() ? (router.getParams() as ESObject)['view']['parentWidth'] : 0
  @State parentHeight: number = router.getParams() ? (router.getParams() as ESObject)['view']['parentHeight'] : 0
  @State referenceComponentKey: string = router.getParams() ? (router.getParams() as ESObject)['view']['referenceComponentKey'] : ''

  onPageShow() {
    console.info('padding page show called ')
    attrsManager.registerDataChange((value: ESObject) => {
      this._padding = value.padding
    })
  }

  @Styles
  commonStyle(){
    .padding(this._padding)
    .key(this.componentKey)
  }

  build() {
    Row() {
      if (this.targetView == 'Badge') {
        Badge({
          count: 50,
          style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red }
        }) {
          Button('message')
            .backgroundColor(0x317aff)
        }.commonStyle()
      } else if (this.targetView == 'Column') {
        Column() {
          Button('message')
            .backgroundColor(0x317aff)
        }.commonStyle()
      } else if (this.targetView == 'Counter') {
        Counter() {
        }.commonStyle()
      } else if (this.targetView == 'GridRow') {
        GridRow({
          columns: 5,
          gutter: { x: 5, y: 10 },
          direction: GridRowDirection.Row
        }) {
          GridCol({ span: 5 }) {
            Row()
              .width('100%')
              .height('100%')
              .backgroundColor('#FF3333')
          }
          .width('100%')
          .height('100%')
          .key(this.referenceComponentKey)
        }.commonStyle()
      } else if (this.targetView == 'Grid') {
        Grid() {
          GridItem() {
            Text('day')
              .backgroundColor(0xF9CF93)
              .textAlign(TextAlign.Center)
          }
        }.commonStyle()
      } else if (this.targetView == 'List') {
        List() {
          ListItem() {
            Row()
              .width('100%')
              .height('100%')
              .backgroundColor('#FF3333')
          }
          .width('100%')
          .height('100%')
          .key(this.referenceComponentKey)
        }
        .commonStyle()
        .width('50%')
        .height('50%')
      } else if (this.targetView == 'Panel') {
        Panel(true) {
          Column() {
            Row()
              .width('100%')
              .height('100%')
              .backgroundColor('#FF3333')
          }
          .width('100%')
          .height('100%')
          .key(this.referenceComponentKey)
        }
        .mode(PanelMode.Full)
        .commonStyle()
        .height('50%')
        .width('50%')
        .dragBar(false)
      } else if (this.targetView == 'Refresh') {
        Refresh({ refreshing: false }) {
          Text('123')
        }.commonStyle()
      } else if (this.targetView == 'Row') {
        Row() {
          Button('message')
            .backgroundColor(0x317aff)
        }.commonStyle()
      } else if (this.targetView == 'Scroll') {
        Scroll() {
          Button('message')
            .backgroundColor(0x317aff)
        }.commonStyle()
      } else if (this.targetView == 'SideBarContainer') {
        SideBarContainer(SideBarContainerType.Embed) {
          Column() {
            ForEach([1, 2, 3], (item: string) => {
              Column({ space: 5 }) {
                Image($r('app.media.icon'))
                  .width(64)
                  .height(64)
                Text('Index0' + item)
                  .fontSize(25)
              }

            })
          }.width('100%').height('100%')
          .justifyContent(FlexAlign.SpaceEvenly)
          .backgroundColor(Color.Green)

          Column() {
            Text('SideBarContainer content').fontSize(25)
          }.width('100%')
          .height('100%')
          .backgroundColor(Color.Orange)
          .key(this.referenceComponentKey)
        }
        .commonStyle()
        .width('50%')
        .height('50%')
      } else if (this.targetView == 'Stack') {
        Stack() {
          Button('message')
            .backgroundColor(0x317aff)
        }.commonStyle()
      } else if (this.targetView == 'Swiper') {
        Swiper() {
          Button('message')
            .backgroundColor(0x317aff)
        }.commonStyle()
      } else if (this.targetView == 'Tabs') {
        Tabs() {
          TabContent() {
            Row()
              .height('100%')
              .width('100%')
              .backgroundColor('#FF3333')
          }
          .height('100%')
          .width('100%')
          .key(this.referenceComponentKey)
        }.commonStyle()
        .height('50%')
        .width('50%')
      } else if (this.targetView == 'TabContent') {
        Tabs() {
          TabContent() {
            Row()
              .height('100%')
              .width('100%')
              .backgroundColor('#FF3333')
              .key(this.referenceComponentKey)
          }
          .commonStyle()
          .height('50%')
          .width('50%')
        }.key(this.parentComponentKey)
        .width(this.parentWidth)
        .height(this.parentHeight)
      } else if (this.targetView == 'WaterFlow') {
        WaterFlow() {
          FlowItem() {
            Text('1').height('100%').width('100%')
          }.key(this.referenceComponentKey)
        }.height('50%').width('50%').commonStyle()
      } else if (this.targetView == 'ColumnSplit') {
        ColumnSplit() {
          Text('1')
            .width('100%')
            .height('100%')
            .backgroundColor(0xF5DEB3)
            .key(this.referenceComponentKey)
        }
        .commonStyle()
        .width('50%')
        .height('50%')
      } else if (this.targetView == 'Flex') {
        Flex() {
          Row()
            .width('100%')
            .height('100%')
            .backgroundColor('#FF3333')
            .key(this.referenceComponentKey)
        }
        .commonStyle()
        .width('50%')
        .height('50%')
      } else if (this.targetView == 'FlowItem') {
        WaterFlow() {
          FlowItem() {
            Row()
              .width('100%')
              .height('100%')
              .backgroundColor('#FF3333')
              .key(this.referenceComponentKey)
          }.commonStyle()
          .width('50%')
          .height('50%')
        }.key(this.parentComponentKey).width(this.parentWidth).height(this.parentHeight)
      } else if (this.targetView == 'GridCol') {
        GridRow({
          columns: 5,
          gutter: { x: 5, y: 10 },
          breakpoints: { value: ['400vp', '600vp', '800vp'], reference: BreakpointsReference.WindowSize },
          direction: GridRowDirection.Row
        }) {
          GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } }) {
            Row()
              .width('100%')
              .height('100%')
              .backgroundColor('#FF3333')
              .key(this.referenceComponentKey)
          }.commonStyle()
        }.width(this.parentWidth)
        .height(this.parentHeight)
        .key(this.parentComponentKey)
      } else if (this.targetView == 'GridItem') {
        Grid() {
          GridItem().commonStyle()
        }.key(this.parentComponentKey)
        .width(this.parentWidth)
        .height(this.parentHeight)
      } else if (this.targetView == 'ListItemGroup') {
        List({ space: 20 }) {
          ListItemGroup() {
            ListItem() {
              Row()
                .width('100%')
                .height('100%')
                .backgroundColor('#FF3333')
            }
            .width('100%')
            .height('100%')
            .key(this.referenceComponentKey)
          }.commonStyle()
        }.key(this.parentComponentKey)
        .width(this.parentWidth)
        .height(this.parentHeight)
      } else if (this.targetView == 'Navigator') {
        Navigator().commonStyle()
      } else if (this.targetView == 'RelativeContainer') {
        RelativeContainer() {
          Row()
            .width('100%')
            .height('100%')
            .backgroundColor('#FF3333')
            .key(this.referenceComponentKey)
        }
        .height('50%')
        .width('50%')
        .backgroundColor(Color.Green)
        .commonStyle()
      } else if (this.targetView == 'RowSplit') {
        RowSplit() {
          Text('1')
            .width('100%')
            .height('100%')
            .backgroundColor(0xF5DEB3)
            .key(this.referenceComponentKey)
        }
        .commonStyle()
        .width('50%')
        .height('50%')
      } else if (this.targetView == 'ListItem') {
        List() {
          ListItem() {
            Row()
              .width('100%')
              .height('100%')
              .backgroundColor('#FF3333')
              .key(this.referenceComponentKey)
          }
          .commonStyle()
          .height('50%')
          .width('50%')
          .backgroundColor(Color.Green)
        }
        .key(this.parentComponentKey)
        .width(this.parentWidth)
        .height(this.parentHeight)
      }
    }.backgroundColor(this.parentBackGroundColor)
    .height(this.parentHeight)
    .width(this.parentWidth)
  }
}