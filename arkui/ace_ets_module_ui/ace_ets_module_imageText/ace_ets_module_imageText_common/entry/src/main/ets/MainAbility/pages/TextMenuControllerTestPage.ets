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
import { TextMenuController } from '@kit.ArkUI';

@Entry
@Component
struct TextMenuControllerTestPage {
  private textMenuController: TextMenuController = this.getUIContext().getTextMenuController();
  @State setMenuOptionsResult: string = '未测试';
  @State disableMenuItemsResult: string = '未测试';

  build() {
    Column({ space: 2 }) {
      Text('TextMenuController Test Page')
        .fontSize(20).height('3%')
        .fontWeight(FontWeight.Bold)

      Row({ space: 1 }) {
        Button('setMenuOptions null')
          .id('button_setMenuOptions_null')
          .onClick(() => {
            try {
              this.textMenuController.setMenuOptions(null);
              AppStorage.setOrCreate('setMenuOptions_null', 'setMenuOptions null succ');
              this.setMenuOptionsResult = 'setMenuOptions null 调用成功';
            } catch (error) {
              this.setMenuOptionsResult = `setMenuOptions null 抛出异常: ${error}`;
            }
          })

        Button('setMenuOptions undefined')
          .id('button_setMenuOptions_undefined')
          .onClick(() => {
            try {
              this.textMenuController.setMenuOptions(undefined);
              AppStorage.setOrCreate('setMenuOptions_undefined', 'setMenuOptions undefined succ');
              this.setMenuOptionsResult = 'setMenuOptions undefined 调用成功';
            } catch (error) {
              this.setMenuOptionsResult = `setMenuOptions undefined 抛出异常: ${error}`;
            }
          })
      }.height('3%')

      Row({ space: 1 }) {
        Button('disableMenuItems null')
          .id('button_disableMenuItems_null')
          .onClick(() => {
            try {
              TextMenuController.disableMenuItems(null);
              AppStorage.setOrCreate('disableMenuItems_null', 'disableMenuItems null succ');
              this.disableMenuItemsResult = 'disableMenuItems null 调用成功';
            } catch (error) {
              this.disableMenuItemsResult = `disableMenuItems null 抛出异常: ${error}`;
            }
          })

        Button('disableMenuItems undefined')
          .id('button_disableMenuItems_undefined')
          .onClick(() => {
            try {
              TextMenuController.disableMenuItems(undefined);
              AppStorage.setOrCreate('disableMenuItems_undefined', 'disableMenuItems undefined succ');
              this.disableMenuItemsResult = 'disableMenuItems undefined 调用成功';
            } catch (error) {
              this.disableMenuItemsResult = `disableMenuItems undefined 抛出异常: ${error}`;
            }
          })
      }.height('3%')

      Button('正常测试').height('3%')
        .onClick(() => {
          try {
            this.textMenuController.setMenuOptions({
              showMode: TextMenuShowMode.PREFER_WINDOW
            });
            this.setMenuOptionsResult = '正常 setMenuOptions 调用成功';

            TextMenuController.disableMenuItems([]);
            this.disableMenuItemsResult = '正常 disableMenuItems 调用成功';
          } catch (error) {
            this.setMenuOptionsResult = `正常测试失败: ${error}`;
          }
        })

      Button('恢复默认设置').height('3%')
        .onClick(() => {
          try {
            this.textMenuController.setMenuOptions({
              showMode: TextMenuShowMode.DEFAULT
            });
            this.setMenuOptionsResult = '已恢复默认设置';

            TextMenuController.disableMenuItems([]);
            this.disableMenuItemsResult = '已恢复默认设置';
          } catch (error) {
            this.setMenuOptionsResult = `恢复默认设置失败: ${error}`;
          }
        })

      TextInput({ text: '这是一个TextInput，长按弹出文本选择菜单' })
        .height('3%')
        .fontStyle(FontStyle.Italic)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
        .caretStyle({ width: '4vp' })

      Text('这是一个Text，长按弹出文本选择菜单')
        .height('3%')
        .copyOption(CopyOptions.InApp)
        .fontStyle(FontStyle.Italic)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
    }.width('100%')
  }
}

