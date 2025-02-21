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
import { CounterType, CounterComponent } from '@ohos.arkui.advanced.Counter';

@Entry
@Component
struct ListCounterExample {
  @State text1: string = ''
  @State text2: string = ''

  build() {
    Column() {
      Text(this.text1).key('counterApiText1')
      Text(this.text2).key('counterApiText2')


      //列表型Counter
      CounterComponent({ options: {
        type: CounterType.LIST,
        numberOptions: {
          label: "价格",
          min: 0,
          value: 5,
          max: 10,
          onFocusIncrease: () => {
            this.text1 = 'onFocusIncrease'
          },
          onBlurIncrease: () => {
            this.text1 = 'onBlurIncrease'
          },
          onFocusDecrease: () => {
            this.text2 = 'onFocusDecrease'
          },
          onBlurDecrease: () => {
            this.text2 = 'onBlurDecrease'
          },

        }
      }
      }).key('counterApi')

      //数值内联型Counter
      CounterComponent({ options: {
        type: CounterType.INLINE,
        inlineOptions: {
          value: 100,
          min: 10,
          step: 2,
          max: 1000,
          textWidth: 100,
          onChange: (value: number) => {
            console.log("onDateChange Date: " + value.toString());
          }
        } }
      }).key('counterApi2').focusable(false)

      CounterComponent({ options: {
        type: CounterType.INLINE_DATE,
        dateOptions: {
          year: 2016,
          onDateChange: () => {

          }
        } }
      }).focusable(false)

    }
  }
}