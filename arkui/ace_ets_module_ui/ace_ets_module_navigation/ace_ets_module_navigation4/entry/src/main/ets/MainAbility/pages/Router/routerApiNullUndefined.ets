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

import { router } from '@kit.ArkUI';
import router1 from '@system.router';

@Entry
@Component
struct routerApiNullUndefined {
  @State str:string = 'hello'

  build() {
    Column({space:5}) {
      Text(this.str).height(25).id('routerTextNullUndefined')
      Button() {
        Text('nextPage').height(25)
      }
      .id('routerButtonNullUndefined')
      .height(25)
      .backgroundColor(Color.Blue)
      .onClick(() => {
        try {
          router1.push(null)
          router1.push(undefined)
          router1.replace(null)
          router1.replace(undefined)
          router1.back(null)
          router1.back(undefined)
          router1.enableAlertBeforeBackPage(null)
          router1.enableAlertBeforeBackPage(undefined)
          router1.disableAlertBeforeBackPage(null)
          router1.disableAlertBeforeBackPage(undefined)

          router.replaceUrl(null);
          router.replaceUrl(undefined);
          router.replaceUrl(null,null);
          router.replaceUrl(undefined,undefined);
          router.replaceUrl(null,null,null);
          router.replaceUrl(undefined,undefined,undefined);

          router.back(null);
          router.back(undefined);
          router.back(null,null);
          router.back(undefined,undefined);

          router.getStateByUrl('');
          router.getStateByUrl(null);
          router.getStateByUrl(undefined);
          router.enableAlertBeforeBackPage(null);
          router.enableAlertBeforeBackPage(undefined);
          try {
            router.showAlertBeforeBackPage(null);
          } catch (error) {
            console.info('error')
          }
          try {
            router.showAlertBeforeBackPage(undefined);
          } catch (error) {
            console.info('error')
          }

          router.pushNamedRoute(null);
          router.pushNamedRoute(undefined);
          router.pushNamedRoute(null,null);
          router.pushNamedRoute(undefined,undefined);
          router.pushNamedRoute(null,null,null);
          router.pushNamedRoute(undefined,undefined,undefined);

          router.replaceNamedRoute(null);
          router.replaceNamedRoute(undefined);
          router.replaceNamedRoute(null,null);
          router.replaceNamedRoute(undefined,undefined);
          router.replaceNamedRoute(null,null,null);
          router.replaceNamedRoute(undefined,undefined,undefined);
        } catch (error) {
          console.info('error')
        }
        this.str = 'routerNullUndefined'
      })
    }
    .width('100%')
    .height('100%')
  }
}