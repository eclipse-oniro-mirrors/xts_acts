/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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
import { AtomicServiceSearch } from '@ohos.atomicservice.AtomicServiceSearch'


@Component
export struct Demo05 {
  controller: SearchController = new SearchController();

  build() {
    Column({space: 8}) {
      // 29 测试Select-divider
      Text('----------测试Select-divider-----------').fontColor(Color.Red).fontWeight(700);

      AtomicServiceSearch({
        select: {
          options: [
            { value: 'Select1', icon: $r('app.media.icon') },
            { value: 'Select2', icon: $r('app.media.icon') },
            { value: 'Select3', icon: $r('app.media.icon') },
            { value: 'Select4', icon: $r('app.media.icon') }
          ],
          selected: 1,
          selectValue: 'Select1',
          onSelect: (index: number) => {
            if (index === 0) {
              this.alert('Select1');
            } else if (index === 1) {
              this.alert('Select2');
            } else if (index === 2) {
              this.alert('Select3');
            } else if (index === 3) {
              this.alert('Select4');
            }
          },
          // divider: ({
          //   strokeWidth: 0.5,
          //   color: Color.Red,
          //   startMargin: 10,
          //   endMargin: 10
          // })
          divider: null
        }
      })

      // 30 测试Select-字体及背景色
      Text('-------测试Select-字体及背景色-------').fontColor(Color.Red).fontWeight(700);

      AtomicServiceSearch({
        select: {
          options: [
            { value: '选项1', icon: $r('app.media.icon') },
            { value: '选项2', icon: $r('app.media.icon') },
            { value: '选项3', icon: $r('app.media.icon') },
            { value: '选项4', icon: $r('app.media.icon') },
            { value: '选项5', icon: $r('app.media.icon') },
            { value: '选项6', icon: $r('app.media.icon') },
            { value: '选项7', icon: $r('app.media.icon') },
            { value: '选项8', icon: $r('app.media.icon') },
            { value: '选项9', icon: $r('app.media.icon') },
            { value: '选项10', icon: $r('app.media.icon') },
            { value: '选项11', icon: $r('app.media.icon') },
            { value: '选项12', icon: $r('app.media.icon') },
            { value: '选项13', icon: $r('app.media.icon') },
            { value: '选项14', icon: $r('app.media.icon') },
            { value: '选项15', icon: $r('app.media.icon') },
            { value: '选项16', icon: $r('app.media.icon') },
            { value: '选项17', icon: $r('app.media.icon') },
            { value: '选项18', icon: $r('app.media.icon') },
            { value: '选项19', icon: $r('app.media.icon') },
            { value: '选项20', icon: $r('app.media.icon') },
            { value: '选项21', icon: $r('app.media.icon') },
            { value: '选项22', icon: $r('app.media.icon') },
            { value: '选项23', icon: $r('app.media.icon') },
            { value: '选项24', icon: $r('app.media.icon') },
            { value: '选项25', icon: $r('app.media.icon') },
            { value: '选项26', icon: $r('app.media.icon') },
            { value: '选项27', icon: $r('app.media.icon') },
            { value: '选项28', icon: $r('app.media.icon') },
          ],
          selected: -1,
          selectValue: '选项1',
          onSelect: (index: number) => {
            if (index === 0) {
              this.alert('选项1');
            } else if (index === 1) {
              this.alert('选项2');
            } else if (index === 2) {
              this.alert('选项3');
            } else if (index === 3) {
              this.alert('选项4');
            }
          },
          font: {
            size: -1,
            weight: 700,
          },
          fontColor: Color.Blue,
          selectedOptionBgColor: '#c0ebd7',
          selectedOptionFont: {
            size: 20,
            weight: 700,
          },
          selectedOptionFontColor: Color.Red,
          optionBgColor: Color.Gray,
          optionFont: {
            size: 16,
            weight: 700,
          },
          optionFontColor: Color.Red,
          optionWidth: OptionWidthMode.FIT_CONTENT,
          optionHeight: 0,
          menuBackgroundColor: '#e0eee8',
          menuBackgroundBlurStyle: BlurStyle.Thin
        },
      });

      Select([
        { value: '选项1', icon: $r('app.media.icon') },
        { value: '选项2', icon: $r('app.media.icon') },
        { value: '选项3', icon: $r('app.media.icon') },
        { value: '选项4', icon: $r('app.media.icon') }
      ]).value('test').optionHeight(100)

      // 31 测试Select-space
      Text('----------测试Select-space-----------').fontColor(Color.Red).fontWeight(700);

      AtomicServiceSearch({
        select: {
          options: [
            { value: '选项1', icon: $r('app.media.icon') },
            { value: '选项2', icon: $r('app.media.icon') },
            { value: '选项3', icon: $r('app.media.icon') },
            { value: '选项4', icon: $r('app.media.icon') }
          ],
          selected: -1,
          selectValue: '选项1',
          onSelect: (index: number) => {
            if (index === 0) {
              this.alert('选项1');
            } else if (index === 1) {
              this.alert('选项2');
            } else if (index === 2) {
              this.alert('选项3');
            } else if (index === 3) {
              this.alert('选项4');
            }
          },
          space: 20
        },
      });

      // 32 测试Select-arrowPosition
      Text('-------测试Select-arrowPosition-------').fontColor(Color.Red).fontWeight(700);

      AtomicServiceSearch({
        select: {
          options: [
            { value: '选项1', icon: $r('app.media.icon') },
            { value: '选项2', icon: $r('app.media.icon') },
            { value: '选项3', icon: $r('app.media.icon') },
            { value: '选项4', icon: $r('app.media.icon') }
          ],
          selected: -1,
          selectValue: '选项1',
          onSelect: (index: number) => {
            if (index === 0) {
              this.alert('选项1');
            } else if (index === 1) {
              this.alert('选项2');
            } else if (index === 2) {
              this.alert('选项3');
            } else if (index === 3) {
              this.alert('选项4');
            }
          },
          arrowPosition: ArrowPosition.START
        },
      });

      // 33 测试Select-menuAlign
      Text('----------测试Select-menuAlign-----------').fontColor(Color.Red).fontWeight(700);

      AtomicServiceSearch({
        placeholder:'test',
        select: {
          options: [
            { value: '选项1', icon: $r('app.media.icon') },
            { value: '选项2', icon: $r('app.media.icon') },
            { value: '选项3', icon: $r('app.media.icon') },
            { value: '选项4', icon: $r('app.media.icon') }
          ],
          selected: -1,
          selectValue: '选项1',
          onSelect: (index: number) => {
            if (index === 0) {
              this.alert('选项1');
            } else if (index === 1) {
              this.alert('选项2');
            } else if (index === 2) {
              this.alert('选项3');
            } else if (index === 3) {
              this.alert('选项4');
            }
          },
          menuAlign: {
            alignType: MenuAlignType.START,
            offset: { dx: 100, dy: 100 }
          },
        },
      }).width(200);

      // 34 测试controller
      Text('--------------测试controller---------------').fontColor(Color.Red).fontWeight(700);

      Button('caretPosition to 1').onClick(() => {
        this.controller.caretPosition(1);
      }).width('100%')
      Button('stopEditing').onClick(() => {
        this.controller.stopEditing();
      }).width('100%')
      Button('Selection [0,3]').onClick(() => {
        this.controller.setTextSelection(0, 3)
      }).width('100%')
      AtomicServiceSearch(
        {
          value: 'Default Value',
          placeholder: 'Type to Search...',
          controller: this.controller,
          search: {
            searchButton: {
              searchButtonValue: 'SEARCH',
              options: { fontSize: '12fp', fontColor: '#ff0e1216' }
            }
          }
        },
      );
    }
  }

  private alert(message: string): void {
    AlertDialog.show({
      message: message
    })
  }
}
