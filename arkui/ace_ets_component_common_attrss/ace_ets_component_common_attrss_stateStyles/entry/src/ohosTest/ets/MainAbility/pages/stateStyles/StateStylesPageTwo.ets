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

import AttrsManager from '../../common/AttrsManager';
import router from '@ohos.router'

@Entry
@Component
struct StateStylesPageTwo {
  @State _isSelect: boolean = true
  @State targetView: string = router.getParams() ? (router.getParams() as ESObject)['view']['targetView'] : ''
  @State componentKey: string = router.getParams() ? (router.getParams() as ESObject)['view']['componentKey'] : ''

  onPageShow() {
    console.info('StateStylesPageTwo show called ')
    AttrsManager.registerDataChange((value: boolean) => this._isSelect = value)
    console.info('this._isSelect:' + this._isSelect)
  }

  @Styles
  selectedStyles() {
    .zIndex(2)
  }

  @Styles
  normalStyles() {
    .zIndex(1)
  }

  @Styles
  commonStyle(){
    .key(this.componentKey)
    .stateStyles({
      normal: this.normalStyles,
      selected: this.selectedStyles
    })
  }

  build() {
    Row() {
      Stack() {
        if (this.targetView == 'Checkbox') {
          Checkbox().select(this._isSelect).commonStyle()
        } else if (this.targetView == 'CheckboxGroup') {
          CheckboxGroup({ group: 'checkboxGroup' }).selectAll(this._isSelect).commonStyle()
        } else if (this.targetView == 'Radio') {
          Radio({ value: 'Radio1', group: 'radioGroup' }).checked(this._isSelect).commonStyle()
        } else if (this.targetView == 'Toggle') {
          Toggle({ type: ToggleType.Switch, isOn: this._isSelect }).commonStyle()
        } else if (this.targetView == 'MenuItem') {
          Menu() {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' })
              .selected(this._isSelect).commonStyle()
          }.backgroundColor(Color.Yellow)
          .width('100%')
          .height('100%')
        }
      }
      .backgroundColor(Color.Pink)
      .width('100%')
      .width('100%')
    }
    .backgroundColor(Color.Yellow)
  }
}