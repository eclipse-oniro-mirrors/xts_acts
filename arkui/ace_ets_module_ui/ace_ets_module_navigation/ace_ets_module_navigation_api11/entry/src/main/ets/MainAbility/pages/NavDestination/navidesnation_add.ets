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
@Entry
@Component
struct Navidesnation_add {
  private arr: number[] = [0, 1, 2, 3]
  @State isActive: boolean = false
  @State dex: number = 0
  @State value:boolean = false;
  build() {
    Column() {
      NavDestination() {
        Text(`我是NavDestination1页内容`).fontSize(50)
        Flex({ direction: FlexDirection.Row }) {
          Row() {
            Image($r('app.media.icon')).width(40).height(40).borderRadius(40).margin({ right: 15 })
            Text('今天共有七节课').fontSize(30)
          }.padding({ left: 15 })
        }
      }.backgroundColor('#ccc')
      .title(`NavDestination1`).onShown(()=>{

      }).onHidden(()=>{

      }).onBackPressed(()=> {
          return this.value
      })
    }.height('100%')
  }
}