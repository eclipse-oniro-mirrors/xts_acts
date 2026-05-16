/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct MouseEventWindowExample {
  @State mouseText: string = '';
  @State action: string = '';

  build() {
    Column() {
      Button('onMouse')
        .width('30%').height('15%')
        .onMouse((event: MouseEvent): void => {
          if (event) {
            switch (event.action) {
              case MouseAction.ENTER_WINDOW:
                this.action = 'ENTER_WINDOW';
                AppStorage.setOrCreate('ENTER_WINDOW', MouseAction.ENTER_WINDOW)
                break;
              case MouseAction.LEAVE_WINDOW:
                this.action = 'LEAVE_WINDOW';
                AppStorage.setOrCreate('LEAVE_WINDOW', MouseAction.LEAVE_WINDOW)
                break;
            }
            this.mouseText = '\nAction = ' + this.action;
          }
        }).id('mouseButton')
      Text(this.mouseText).height('10%').id('mouseText')
    }.height('90%').width('100%')
  }
}