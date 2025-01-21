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

import router from '@ohos.router';

@Entry
@Component
struct DefaultByGridRowPage {
  @State parentWidth: number = router.getParams() ? router.getParams()['view']['parentWidth'] : 0
  @State parentHeight: number = router.getParams() ? router.getParams()['view']['parentHeight'] : 0
  @State targetView: string = router.getParams() ? router.getParams()['view']['targetView'] : ''
  @State componentKey: string = router.getParams() ? router.getParams()['view']['componentKey'] : ''

  onPageShow() {
    console.info('DefaultByGridRowPage show called ')
  }

  /*
   * Set common style.
   */
  @Styles commonStyle(){
    .key(this.componentKey)
  }

  //Draw screen
  build() {
    GridRow() {
      if (this.targetView == 'GridCol') {
        GridCol().commonStyle()
      }
    }.width(this.parentWidth).height(this.parentHeight).backgroundColor(Color.Green)
  }
}