/**
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
struct stepperAction027 {
  @State currentIndex: number = 0
  build() {
    Column(){
      Stepper({
        index: this.currentIndex
      }) {
          StepperItem() {
            Text('Page One')
          }
          .nextLabel('Next1111111111111111111111111111111111111111111111111')

          StepperItem() {
            Text('Page Two')
          }
          .nextLabel('Next2222222222222222222222222222222222222222222222222')
          .prevLabel('Previous111111111111111111111111111111111111111111111111111')

          StepperItem() {
            Text('Page Three')
          }
          .prevLabel('Previous2222222222222222222222222222222222222222222222222222')
      }
    }
  }
}