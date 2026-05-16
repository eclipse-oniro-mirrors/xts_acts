/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
struct ListItemGroupHeaderFooterStyleUx{
  @State message: string = 'Hello World'

  @Builder
  headFoot(text: string) {
    Text(text)
      .backgroundColor(0xAABBCC)
      .width('100%')
      .height('50%')
  }

  build() {
    Column() {
      // ========== ListItemGroup ListItemGroupHeaderFooterStyle ==========
      Row(){
        Column(){
          List() {
            ListItemGroup({
              header: this.headFoot('header1'),
              headerStyle: ListItemGroupHeaderFooterStyle.NONE
            }) {
              ListItem({ style: ListItemStyle.CARD }) {
                Text('headerStyle.NONE')
                  .width('100%')
                  .fontSize(10)
                  .textAlign(TextAlign.Center)
              }
            }
            .id('list_headerStyle_none')
          }
        }
        .width('50%')

        Column(){
          List() {
            ListItemGroup({
              header: this.headFoot('header2'),
              headerStyle: ListItemGroupHeaderFooterStyle.FLOATING
            }) {
              ListItem({ style: ListItemStyle.CARD }) {
                Text('headerStyle.FLOATING')
                  .width('100%')
                  .fontSize(10)
                  .textAlign(TextAlign.Center)
              }
            }
            .id('list_headerStyle_floating')
          }
        }
        .width('50%')

      }
      .width('100%')
      .height('20%')

      Row(){
        Column(){
          List() {
            ListItemGroup({
              header: this.headFoot('header3'),
              headerStyle: null
            }) {
              ListItem({ style: ListItemStyle.CARD }) {
                Text('headerStyle.null')
                  .fontSize(10)
                  .width('100%')
                  .textAlign(TextAlign.Center)
              }
            }
            .id('list_headerStyle_null')
          }
        }
        .width('50%')

        Column(){
          List() {
            ListItemGroup({
              header: this.headFoot('header4'),
              headerStyle: undefined
            }) {
              ListItem({ style: ListItemStyle.CARD }) {
                Text('headerStyle.undefined')
                  .fontSize(10)
                  .width('100%')
                  .textAlign(TextAlign.Center)
              }
            }
            .id('list_headerStyle_undefined')
          }
        }
        .width('50%')
      }
      .width('100%')
      .height('20%')

      Row(){
        Column(){
          List() {
            ListItemGroup({
              footer: this.headFoot('footer1'),
              footerStyle: ListItemGroupHeaderFooterStyle.NONE
            }) {
              ListItem({ style: ListItemStyle.CARD }) {
                Text('footerStyle.NONE')
                  .fontSize(10)
                  .width('100%')
                  .textAlign(TextAlign.Center)
              }
            }
            .id('list_footerStyle_none')
          }
        }
        .width('50%')

        Column(){
          List() {
            ListItemGroup({
              footer: this.headFoot('footer2'),
              footerStyle: ListItemGroupHeaderFooterStyle.FLOATING
            }) {
              ListItem({ style: ListItemStyle.CARD }) {
                Text('footerStyle.FLOATING')
                  .fontSize(10)
                  .width('100%')
                  .textAlign(TextAlign.Center)
              }
            }
            .id('list_footerStyle_floating')
          }
        }
        .width('50%')
      }
      .width('100%')
      .height('20%')

      Row(){
        Column(){
          List() {
            ListItemGroup({
              footer: this.headFoot('footer3'),
              footerStyle: null
            }) {
              ListItem({ style: ListItemStyle.CARD }) {
                Text('footerStyle.null')
                  .fontSize(10)
                  .width('100%')
                  .textAlign(TextAlign.Center)
              }
            }
            .id('list_footerStyle_null')
          }
        }
        .width('50%')

        Column(){
          List() {
            ListItemGroup({
              footer: this.headFoot('footer4'),
              footerStyle: undefined
            }) {
              ListItem({ style: ListItemStyle.CARD }) {
                Text('footerStyle.undefined')
                  .fontSize(10)
                  .width('100%')
                  .textAlign(TextAlign.Center)
              }
            }
            .id('list_footerStyle_undefined')
          }
        }
        .width('50%')
      }
      .width('100%')
      .height('20%')
    }
    .width('100%')
    .height('100%')
  }
}