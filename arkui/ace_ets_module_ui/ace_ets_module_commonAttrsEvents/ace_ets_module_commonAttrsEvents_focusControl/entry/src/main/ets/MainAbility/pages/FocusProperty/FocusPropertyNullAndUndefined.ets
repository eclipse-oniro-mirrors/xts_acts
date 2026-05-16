/*
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
@Entry
@Component
struct FocusPropertyTest {
  @State focusBoxNullResult: string = 'Init';
  @State focusBoxUndefinedResult: string = 'Init';
  @State focusScopeIdEmptyResult: string = 'Init';
  @State focusScopeIdNullResult: string = 'Init';
  @State focusScopeIdUndefinedResult: string = 'Init';
  @State focusScopeId14EmptyResult: string = 'Init';
  @State focusScopeId14NullResult: string = 'Init';
  @State focusScopeId14UndefinedResult: string = 'Init';
  @State focusScopeId14ArrowStepOutResult: string = 'Init';
  @State focusScopePriorityScopeIdEmptyResult: string = 'Init';
  @State focusScopePriorityScopeIdNullResult: string = 'Init';
  @State focusScopePriorityScopeIdUndefinedResult: string = 'Init';
  @State focusScopePriorityPriorityNullResult: string = 'Init';
  @State focusScopePriorityPriorityUndefinedResult: string = 'Init';

  build() {
    Column() {
      Text('FocusProperty Test')
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Center)

      Scroll() {
        Column() {
          Row() {
            Button('focusBox null')
              .id('focusBoxNull')
              .focusable(true)
              .focusBox(null)
              .onFocus(() => {
                this.focusBoxNullResult = 'focusBoxNullFocused';
              })
              .onBlur(() => {
                this.focusBoxNullResult = 'focusBoxNullBlurred';
              })
              .width('45%')
              .height('5%')

            Text(this.focusBoxNullResult)
              .id('focusBoxNullResult')
              .width('45%')
              .height('5%')
              .backgroundColor('#FFCCCCCC')
              .textAlign(TextAlign.Center)
          }
          .width('100%')

          Row() {
            Button('focusBox undefined')
              .id('focusBoxUndefined')
              .focusable(true)
              .focusBox(undefined)
              .onFocus(() => {
                this.focusBoxUndefinedResult = 'focusBoxUndefinedFocused';
              })
              .onBlur(() => {
                this.focusBoxUndefinedResult = 'focusBoxUndefinedBlurred';
              })
              .width('45%')
              .height('5%')

            Text(this.focusBoxUndefinedResult)
              .id('focusBoxUndefinedResult')
              .width('45%')
              .height('5%')
              .backgroundColor('#FFCCCCCC')
              .textAlign(TextAlign.Center)
          }
          .width('100%')

          Row() {
            Button('focusScopeId empty')
              .id('focusScopeIdEmpty')
              .focusable(true)
              .focusScopeId('')
              .onFocus(() => {
                this.focusScopeIdEmptyResult = 'focusScopeIdEmptyFocused';
              })
              .onBlur(() => {
                this.focusScopeIdEmptyResult = 'focusScopeIdEmptyBlurred';
              })
              .width('45%')
              .height('5%')

            Text(this.focusScopeIdEmptyResult)
              .id('focusScopeIdEmptyResult')
              .width('45%')
              .height('5%')
              .backgroundColor('#FFCCCCCC')
              .textAlign(TextAlign.Center)
          }
          .width('100%')

          Row() {
            Button('focusScopeId null')
              .id('focusScopeIdNull')
              .focusable(true)
              .focusScopeId(null)
              .onFocus(() => {
                this.focusScopeIdNullResult = 'focusScopeIdNullFocused';
              })
              .onBlur(() => {
                this.focusScopeIdNullResult = 'focusScopeIdNullBlurred';
              })
              .width('45%')
              .height('5%')

            Text(this.focusScopeIdNullResult)
              .id('focusScopeIdNullResult')
              .width('45%')
              .height('5%')
              .backgroundColor('#FFCCCCCC')
              .textAlign(TextAlign.Center)
          }
          .width('100%')

          Row() {
            Button('focusScopeId undefined')
              .id('focusScopeIdUndefined')
              .focusable(true)
              .focusScopeId(undefined)
              .onFocus(() => {
                this.focusScopeIdUndefinedResult = 'focusScopeIdUndefinedFocused';
              })
              .onBlur(() => {
                this.focusScopeIdUndefinedResult = 'focusScopeIdUndefinedBlurred';
              })
              .width('45%')
              .height('5%')

            Text(this.focusScopeIdUndefinedResult)
              .id('focusScopeIdUndefinedResult')
              .width('45%')
              .height('5%')
              .backgroundColor('#FFCCCCCC')
              .textAlign(TextAlign.Center)
          }
          .width('100%')

          Row() {
            Button('focusScopeId14 empty')
              .id('focusScopeId14Empty')
              .focusable(true)
              .focusScopeId('', false, false)
              .onFocus(() => {
                this.focusScopeId14EmptyResult = 'focusScopeId14EmptyFocused';
              })
              .onBlur(() => {
                this.focusScopeId14EmptyResult = 'focusScopeId14EmptyBlurred';
              })
              .width('45%')
              .height('5%')

            Text(this.focusScopeId14EmptyResult)
              .id('focusScopeId14EmptyResult')
              .width('45%')
              .height('5%')
              .backgroundColor('#FFCCCCCC')
              .textAlign(TextAlign.Center)
          }
          .width('100%')

          Row() {
            Button('focusScopeId14 null')
              .id('focusScopeId14Null')
              .focusable(true)
              .focusScopeId(null, null, null)
              .onFocus(() => {
                this.focusScopeId14NullResult = 'focusScopeId14NullFocused';
              })
              .onBlur(() => {
                this.focusScopeId14NullResult = 'focusScopeId14NullBlurred';
              })
              .width('45%')
              .height('5%')

            Text(this.focusScopeId14NullResult)
              .id('focusScopeId14NullResult')
              .width('45%')
              .height('5%')
              .backgroundColor('#FFCCCCCC')
              .textAlign(TextAlign.Center)
          }
          .width('100%')

          Row() {
            Button('focusScopeId14 undefined')
              .id('focusScopeId14Undefined')
              .focusable(true)
              .focusScopeId(undefined, undefined, undefined)
              .onFocus(() => {
                this.focusScopeId14UndefinedResult = 'focusScopeId14UndefinedFocused';
              })
              .onBlur(() => {
                this.focusScopeId14UndefinedResult = 'focusScopeId14UndefinedBlurred';
              })
              .width('45%')
              .height('5%')

            Text(this.focusScopeId14UndefinedResult)
              .id('focusScopeId14UndefinedResult')
              .width('45%')
              .height('5%')
              .backgroundColor('#FFCCCCCC')
              .textAlign(TextAlign.Center)
          }
          .width('100%')

          Row() {
            Button('focusScopeId14 arrowStepOut')
              .id('focusScopeId14ArrowStepOut')
              .focusable(true)
              .focusScopeId('testScope', false, false)
              .onFocus(() => {
                this.focusScopeId14ArrowStepOutResult = 'focusScopeId14ArrowStepOutFocused';
              })
              .onBlur(() => {
                this.focusScopeId14ArrowStepOutResult = 'focusScopeId14ArrowStepOutBlurred';
              })
              .width('45%')
              .height('5%')

            Text(this.focusScopeId14ArrowStepOutResult)
              .id('focusScopeId14ArrowStepOutResult')
              .width('45%')
              .height('5%')
              .backgroundColor('#FFCCCCCC')
              .textAlign(TextAlign.Center)
          }
          .width('100%')

          Row() {
            Button('scopePriority empty')
              .id('focusScopePriorityScopeIdEmpty')
              .focusable(true)
              .focusScopePriority('')
              .onFocus(() => {
                this.focusScopePriorityScopeIdEmptyResult = 'focusScopePriorityScopeIdEmptyFocused';
              })
              .onBlur(() => {
                this.focusScopePriorityScopeIdEmptyResult = 'focusScopePriorityScopeIdEmptyBlurred';
              })
              .width('45%')
              .height('5%')

            Text(this.focusScopePriorityScopeIdEmptyResult)
              .id('focusScopePriorityScopeIdEmptyResult')
              .width('45%')
              .height('5%')
              .backgroundColor('#FFCCCCCC')
              .textAlign(TextAlign.Center)
          }
          .width('100%')

          Row() {
            Button('scopePriority null')
              .id('focusScopePriorityScopeIdNull')
              .focusable(true)
              .focusScopePriority(null)
              .onFocus(() => {
                this.focusScopePriorityScopeIdNullResult = 'focusScopePriorityScopeIdNullFocused';
              })
              .onBlur(() => {
                this.focusScopePriorityScopeIdNullResult = 'focusScopePriorityScopeIdNullBlurred';
              })
              .width('45%')
              .height('5%')

            Text(this.focusScopePriorityScopeIdNullResult)
              .id('focusScopePriorityScopeIdNullResult')
              .width('45%')
              .height('5%')
              .backgroundColor('#FFCCCCCC')
              .textAlign(TextAlign.Center)
          }
          .width('100%')

          Row() {
            Button('scopePriority undefined')
              .id('focusScopePriorityScopeIdUndefined')
              .focusable(true)
              .focusScopePriority(undefined)
              .onFocus(() => {
                this.focusScopePriorityScopeIdUndefinedResult = 'focusScopePriorityScopeIdUndefinedFocused';
              })
              .onBlur(() => {
                this.focusScopePriorityScopeIdUndefinedResult = 'focusScopePriorityScopeIdUndefinedBlurred';
              })
              .width('45%')
              .height('5%')

            Text(this.focusScopePriorityScopeIdUndefinedResult)
              .id('focusScopePriorityScopeIdUndefinedResult')
              .width('45%')
              .height('5%')
              .backgroundColor('#FFCCCCCC')
              .textAlign(TextAlign.Center)
          }
          .width('100%')

          Row() {
            Button('priority null')
              .id('focusScopePriorityPriorityNull')
              .focusable(true)
              .focusScopePriority('testScope', null)
              .onFocus(() => {
                this.focusScopePriorityPriorityNullResult = 'focusScopePriorityPriorityNullFocused';
              })
              .onBlur(() => {
                this.focusScopePriorityPriorityNullResult = 'focusScopePriorityPriorityNullBlurred';
              })
              .width('45%')
              .height('5%')

            Text(this.focusScopePriorityPriorityNullResult)
              .id('focusScopePriorityPriorityNullResult')
              .width('45%')
              .height('5%')
              .backgroundColor('#FFCCCCCC')
              .textAlign(TextAlign.Center)
          }
          .width('100%')

          Row() {
            Button('priority undefined')
              .id('focusScopePriorityPriorityUndefined')
              .focusable(true)
              .focusScopePriority('testScope', undefined)
              .onFocus(() => {
                this.focusScopePriorityPriorityUndefinedResult = 'focusScopePriorityPriorityUndefinedFocused';
              })
              .onBlur(() => {
                this.focusScopePriorityPriorityUndefinedResult = 'focusScopePriorityPriorityUndefinedBlurred';
              })
              .width('45%')
              .height('5%')

            Text(this.focusScopePriorityPriorityUndefinedResult)
              .id('focusScopePriorityPriorityUndefinedResult')
              .width('45%')
              .height('5%')
              .backgroundColor('#FFCCCCCC')
              .textAlign(TextAlign.Center)
          }
          .width('100%')
        }
        .width('100%')
      }
      .width('100%')
      .height('85%')
    }
    .width('100%')
    .height('100%')
  }
}
