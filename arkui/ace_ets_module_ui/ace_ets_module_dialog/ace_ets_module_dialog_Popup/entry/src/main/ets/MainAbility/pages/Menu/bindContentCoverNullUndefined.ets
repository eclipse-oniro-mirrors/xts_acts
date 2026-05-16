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
struct bindContentCoverNullUndefinedExample {
  @State isShow: boolean = false
  @State isShow1: boolean = false
  @State isShow2: boolean = false
  @State isShow3: boolean = false
  @State isShow4: boolean = false
  @State isShow5: boolean = false

  @Builder
  myBuilder() {
    Column() {
      Button('close modal')
        .id('bindContentCover_close_nullNu')
        .margin(10)
        .fontSize(20)
        .onClick(() => {
          this.isShow = false;
          this.isShow1 = false;
          this.isShow2 = false;
          this.isShow3 = false;
          this.isShow4 = false;
          this.isShow5 = false;
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column() {
      // ========== bindContentCover tests ==========
      Text('bindContentCover')
      Row(){
        Button('null2')
          .id('bindContentCover_builder_null')
          .onClick(() => {
            this.isShow = true;
          })
          .bindContentCover(this.isShow!!, null)

        Button('undefined2')
          .id('bindContentCover_builder_undefined')
          .onClick(() => {
            this.isShow1 = true;
          })
          .bindContentCover(this.isShow1!!, undefined)
      }.height('10%')

      Row(){
        Button('null3')
          .id('bindContentCover_options_null')
          .onClick(()=>{
            this.isShow2 = true
          })
          .bindContentCover(this.isShow2!!, this.myBuilder(), null)

        Button('undefined3')
          .id('bindContentCover_options_undefined')
          .onClick(()=>{
            this.isShow3 = true
          })
          .bindContentCover(this.isShow3!!, this.myBuilder(), undefined)
      }.height('10%')

      Text('enableSafeArea')
      Row(){
        Button('true')
          .id('bindContentCover_enableSafeArea_true')
          .onClick(()=>{
            this.isShow4 = true
          })
          .bindContentCover(this.isShow4!!, this.myBuilder(), {
            modalTransition: ModalTransition.NONE,
            backgroundColor: Color.Pink,
            enableSafeArea: true
          })
        Button('false')
          .id('bindContentCover_enableSafeArea_false')
          .onClick(()=>{
            this.isShow5 = true
          })
          .bindContentCover(this.isShow5!!, this.myBuilder(), {
            modalTransition: ModalTransition.ALPHA,
            backgroundColor: 0x87CEEB,
            enableSafeArea: false
          })
      }.height('10%')

    }.width('100%')
    .height('100%')
  }
}