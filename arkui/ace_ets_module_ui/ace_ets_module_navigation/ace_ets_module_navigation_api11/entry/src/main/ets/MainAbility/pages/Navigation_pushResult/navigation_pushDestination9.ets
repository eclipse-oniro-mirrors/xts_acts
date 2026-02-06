/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { BusinessError } from '@ohos.base';

@Entry
@Component
struct navigation_pushDestination9 {
  @State flag : boolean= true
  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack()
  @State result1:string = '1'
  @State result2:string = '2'
  @State result3:string = '3'


  @Builder pageOneTmp() {
    NavDestination() {
      Column({space:5}) {
        Button('pop')
          .fontSize(14)
          .onClick(() => {
            this.pageInfos.pop()
          })
          .id('navigation_pushDestination9_pop')

        Text(this.result1).id('navigation_pushDestination9_text_result1')

      }.width('100%').height('100%')
    }.title('pageOne')
  }


  @Builder pageThreeTmp() {
    NavDestination() {
      Column({space:5}) {
      }.width('100%').height('100%')
    }.title('pageThree')
  }

  @Builder
  PageMap(name: string) {
    if (name === 'pageOne') {
      this.pageOneTmp()
    } else if (name === 'pageThree') {
      this.pageThreeTmp()
    }
  }

  build() {

    Column(){
      Button('close')
        .fontSize(14)
        .onClick(() => {
          this.flag = false
        })
        .id('navigation_pushDestination9_btn')

      if(this.flag){
        Navigation(this.pageInfos) {
          Column({space:5}) {

            Button('pushPageOne')
              .fontSize(14)
              .onClick(() => {
                this.pageInfos.pushDestination({ name: 'pageOne',param:null })
                  .then(()=>{
                    this.result1 = 'success'
                  })
                  .catch((error: BusinessError)=>{
                    this.result1 = (error.code).toString() + error.message
                  })
              })
              .id('navigation_pushDestination9_pushDestinationOne')


            Button('pushPageTwo')
              .fontSize(14)
              .onClick(() => {
                this.pageInfos.pushDestination({ name: 'pageTwo',param:null })
                  .then(()=>{
                    this.result2 = 'success'
                  })
                  .catch((error: BusinessError)=>{
                    this.result2 = (error.code).toString() + error.message
                  })
              })
              .id('navigation_pushDestination9_pushDestinationTwo')

            Button('pushPageThree')
              .fontSize(14)
              .onClick(() => {
                this.pageInfos.pushDestination({ name: 'pageThree',param:null })
                  .then(()=>{
                    this.result3 = 'success'
                  })
                  .catch((error: BusinessError)=>{
                    this.result3 = (error.code).toString() + error.message
                  })
              })

            Text(this.result2).id('navigation_pushDestination9_text_result2')

          }
        }.title('Navigation').navDestination(this.PageMap)

      } else {

        Navigation(this.pageInfos) {
          Column({space:5}) {

            Button('pushPageOne')
              .fontSize(14)
              .onClick(() => {
                this.pageInfos.pushDestination({ name: 'pageOne',param:null })
                  .then(()=>{
                    this.result1 = 'success'
                  })
                  .catch((error: BusinessError)=>{
                    this.result1 = (error.code).toString() + error.message
                  })
              })


            Button('pushPageTwo')
              .fontSize(14)
              .onClick(() => {
                this.pageInfos.pushDestination({ name: 'pageTwo',param:null })
                  .then(()=>{
                    this.result2 = 'success'
                  })
                  .catch((error: BusinessError)=>{
                    this.result2 = (error.code).toString() + error.message
                  })
              })


            Button('pushPageThree')
              .fontSize(14)
              .onClick(() => {
                this.pageInfos.pushDestination({ name: 'pageThree',param:null })
                  .then(()=>{
                    this.result3 = 'success'
                  })
                  .catch((error: BusinessError)=>{
                    this.result3 = (error.code).toString() + error.message
                  })
              })
              .id('navigation_pushDestination9_pushDestinationThree')


            Text(this.result3).id('navigation_pushDestination9_text_result3')

          }
        }.title('Navigation')
      }

    }

  }
}
