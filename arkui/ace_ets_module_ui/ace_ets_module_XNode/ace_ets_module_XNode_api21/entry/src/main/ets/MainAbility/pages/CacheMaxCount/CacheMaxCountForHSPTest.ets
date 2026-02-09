/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
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
import { UIContext } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct ListExample {
  @State errorStr1:string = '5'
  @State errorStr2:string = '5'


  build() {
    Column() {
      Button('count double')
        .id('btn_errorStr1')
        .height('5%')
        .width('100%')
        .onClick(()=>{
          let errorStr: string = '';
          try {
            let count = -1
            UIContext.setResourceManagerCacheMaxCountForHSP(count);
          } catch (e) {
            this.errorStr1 = (e as BusinessError).code + '';
          }
        })
      Button('count < 0')
        .id('btn_errorStr2')
        .height('5%')
        .width('100%')
        .onClick(()=>{
          let errorStr: string = '';
          try {
            let count = 3.1
            UIContext.setResourceManagerCacheMaxCountForHSP(count);
          } catch (e) {
            this.errorStr2 = (e as BusinessError).code + '';
          }
        })
      Text(this.errorStr1).id('txt_errorStr1').height('5%').width('100%')
      Text(this.errorStr2).id('txt_errorStr2').height('5%').width('100%')
    }
    .height('100%')
  }
}